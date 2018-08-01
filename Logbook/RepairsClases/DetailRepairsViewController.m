//
//  DetailRepairsViewController.m
//  Logbook
//
//  Created by mac on 04.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "DetailRepairsViewController.h"
#import "DataManager.h"
#import "Car+CoreDataClass.h"

@interface DetailRepairsViewController ()

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, strong) NSPersistentContainer *persistentContainer;

@end

@implementation DetailRepairsViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.repairDet){
        UIImage *image=[UIImage imageNamed:self.repairDet.imageRepair];
        self.detailImageRepair.image=image;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_managedObjectContext){
        _persistentContainer=[[DataManager dataManager] persistentContainer ];
        _managedObjectContext=_persistentContainer.viewContext;
    }
    
    [self configureView];
    
    [self.detailTextRepair becomeFirstResponder];
    self.detailTextRepair.delegate=self;
    
   UIColor *color=[UIColor whiteColor];
    self.view.backgroundColor=color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string{
    
    NSCharacterSet *validSet=[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validSet];
    if([components count]>1){
        return NO;
    }
    NSString *stringNew = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return [stringNew length] <=9;
}

- (IBAction)saveChengeRepair:(UIButton *)sender {
    
    double valueBefor,valueAfter;
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
            self.repairDetail=[car.repsir allObjects];
            NSPredicate *predicat=[NSPredicate predicateWithFormat:@"nameRepair=%@", self.repairDet.nameRepair];
            self.repairDetailPredicat=[self.repairDetail filteredArrayUsingPredicate:predicat];
            for (Repsir *repair in self.repairDetailPredicat) {
                NSLog(@"consums count %lu",(unsigned long)self.repairDetailPredicat.count);
                valueBefor = [repair.valueRepair doubleValue];
                valueAfter =valueBefor + [self.detailTextRepair.text doubleValue];
                repair.valueRepair = [NSString stringWithFormat:@"%.2f",valueAfter];
            }
        }
    }
    
    self.detailTextRepair.text=@"";
    [_managedObjectContext save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
