//
//  ConsumablesTableViewController.m
//  Logbook
//
//  Created by mac on 03.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "ConsumablesTableViewController.h"
#import "DetailConsumablesViewController.h"
#import "DataManager.h"

@interface ConsumablesTableViewController ()

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, strong) NSPersistentContainer *persistentContainer;

@end

@implementation ConsumablesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_managedObjectContext){
        _persistentContainer=[[DataManager dataManager] persistentContainer ];
        _managedObjectContext=_persistentContainer.viewContext;
    }
    
    NSError *error;
    NSFetchRequest *fechRequest=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Car" inManagedObjectContext:_managedObjectContext];
    [fechRequest setEntity:entity];
    NSArray *feches=[_managedObjectContext executeFetchRequest:fechRequest error:&error];
    
    int keyCar=0;
    NSString *kCurentCar=@"kCurentCar";
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    keyCar=[[userDefault objectForKey:kCurentCar] intValue];
    
    if(feches.count > 0){
        NSLog(@"count %lu ",(unsigned long)feches.count);
        for (Car *car in feches) {
            if(car.namberCar == keyCar){
                //NSLog(@"count %lu ",car.repsir.count);
                self.consumsNoSort=[car.consum allObjects];
                NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"nameConsum" ascending:YES];
                self.consums= [self.consumsNoSort sortedArrayUsingDescriptors:@[sort]];
            }
        }
    }
    
    UIColor *color=[UIColor grayColor];
    self.view.backgroundColor=color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"DetailConsumables" ]){
        
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Consum *object = self.consums [path.row];
        DetailConsumablesViewController *detailViewController =[segue destinationViewController];
        [detailViewController setCurentConsum:object];

    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return self.consums.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier=@"ConsumableCell";
    
    CunsumablesTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if(customCell==nil){
            customCell = [[CunsumablesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ConsumableCell"];
    }
    
    Consum *consum = self.consums [indexPath.row];
    customCell.cunsumablesLabel.text=consum.nameConsum;
    UIImage *image=[UIImage imageNamed:consum.imageStr];
    customCell.cunsumablesImage.image=image;
    
    return customCell;
}

@end
