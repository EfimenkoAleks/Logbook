//
//  RepairsTableViewController.m
//  Logbook
//
//  Created by mac on 04.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "RepairsTableViewController.h"
#import "DetailRepairsViewController.h"
#import "DataManager.h"

@interface RepairsTableViewController ()

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, strong) NSPersistentContainer *persistentContainer;

@end

@implementation RepairsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if(!_managedObjectContext){
        _persistentContainer=[[DataManager dataManager] persistentContainer ];
        _managedObjectContext=_persistentContainer.viewContext;
    }

    NSError *error;
    NSFetchRequest *fechRequest=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Car" inManagedObjectContext:_managedObjectContext];
//    NSPredicate *predicat = [NSPredicate predicateWithFormat:@"name"];
//    [fechRequest setPredicate:predicat];
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
                self.repairsNoSort=[car.repsir allObjects];
                NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"nameRepair" ascending:YES];
                self.repairs= [self.repairsNoSort sortedArrayUsingDescriptors:@[sort]];
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

-(NSManagedObjectContext *) managedObjectContext
{
    if(!_managedObjectContext){
        _persistentContainer=[[DataManager dataManager] persistentContainer ];
        _managedObjectContext=_persistentContainer.viewContext;
    }
    return _managedObjectContext;
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"DetailRepairs" ]){
    
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Repsir *object = self.repairs [path.row];
        DetailRepairsViewController *detailViewController =[segue destinationViewController];
        [detailViewController setRepairDet:object];

    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  self.repairs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *reuseIdentifier=@"RepairCell";

    RepairsTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

    if(customCell==nil){
        customCell = [[RepairsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RepairCell"];
    }

    Repsir *repair = self.repairs [indexPath.row];
    customCell.repairLabel.text=repair.nameRepair;
    UIImage *image=[UIImage imageNamed:repair.imageRepair];
    customCell.repairImage.image=image;

    return customCell;
}

@end
