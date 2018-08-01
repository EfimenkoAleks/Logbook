//
//  CostsTableViewController.m
//  Logbook
//
//  Created by mac on 04.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "CostsTableViewController.h"
#import "DataManager.h"
#import "Car+CoreDataClass.h"
#import "Repsir+CoreDataClass.h"
#import "Consum+CoreDataClass.h"
#import "Refilling+CoreDataClass.h"

@interface CostsTableViewController ()

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, strong) NSPersistentContainer *persistentContainer;

@end

@implementation CostsTableViewController

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
    
        for (Car *car in feches) {
            if(car.namberCar == keyCar){
                NSLog(@"keyCar %d ",car.namberCar);
                NSLog(@"self.repairsDetailNoSort %lu ",self.repairsDetailNoSort.count);
                self.repairsDetailNoSort=[car.repsir allObjects];                
                NSSortDescriptor *sort1 = [NSSortDescriptor sortDescriptorWithKey:@"nameRepair" ascending:YES];
                self.repairsDetail= [self.repairsDetailNoSort sortedArrayUsingDescriptors:@[sort1]];
                NSLog(@"self.repairsDetail %lu ",self.repairsDetailNoSort.count);
                
                self.consumablesDetailNoSort=[car.consum allObjects];
                NSSortDescriptor *sort2 = [NSSortDescriptor sortDescriptorWithKey:@"nameConsum" ascending:YES];
                self.consumablesDetail= [self.consumablesDetailNoSort sortedArrayUsingDescriptors:@[sort2]];
                
                self.fuelingsDetail=@[[NSNumber numberWithDouble: car.refilling.valuePetrol],[NSNumber numberWithDouble: car.refilling.literPetrol],[NSNumber numberWithDouble: car.refilling.valueGas],[NSNumber numberWithDouble: car.refilling.literGas],[NSNumber numberWithDouble: car.refilling.valueDiezel],[NSNumber numberWithDouble: car.refilling.literDiezel]];
                
            }
            
        }
    
    self.fuelings=@[@"Потрачено на бензин",@"количество литров",@"Потрачено за газ",@"количество литров",@"Потрачено на дизель",@"количество литров"];
    self.consumables=@[@"Антифриз и тормозная жидкость",@"Машинное масло",@"Различные фильтры",@"Ремни",@"Свечи зажигания"];
        self.repairs=@[@"Двигатель",@"Другое",@"Кузов",@"Ходовая",@"Элементы салона"];
    
 
    self.costs=@[self.fuelings,self.consumables,self.repairs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.costs.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return self.fuelings.count;
    }
    if(section==1){
        return self.consumables.count;
    }
    if(section==2){
        return self.repairs.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier=@"CostsCell";
    
    UITableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if(customCell==nil){
        customCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CostsCell"];
    }
    if(indexPath.section==0){
        customCell.textLabel.text =self.fuelings[indexPath.row];
        customCell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.fuelingsDetail[indexPath.row]];
    }
    if(indexPath.section==1){
        Consum *cons = self.consumablesDetail [indexPath.row];
        customCell.textLabel.text =self.consumables[indexPath.row];
        customCell.detailTextLabel.text =[NSString stringWithFormat:@"%@", cons.valueConsum ];
    }
    if(indexPath.section==2){
        Repsir *rep = self.repairsDetail [indexPath.row];
        customCell.textLabel.text =self.repairs[indexPath.row];
        customCell.detailTextLabel.text =[NSString stringWithFormat:@"%@", rep.valueRepair ];
    }
    
    return customCell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 20)];
    [label setFont:[UIFont boldSystemFontOfSize:20]];
    NSString *string;
    if(section==0){
        string=@"Заправка автомобиля";
    }
    if(section==1){
        string=@"Расходные материалы";
    }
    if(section==2){
        string=@"Ремонт";
    }
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]];
    
    return view;
}

@end
