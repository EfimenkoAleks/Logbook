//
//  DetailConsumablesViewController.m
//  Logbook
//
//  Created by mac on 03.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "DetailConsumablesViewController.h"
#import "DataManager.h"
#import "Car+CoreDataClass.h"

@interface DetailConsumablesViewController ()

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, strong) NSPersistentContainer *persistentContainer;

@end

@implementation DetailConsumablesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_managedObjectContext){
        _persistentContainer=[[DataManager dataManager] persistentContainer ];
        _managedObjectContext=_persistentContainer.viewContext;
    }
    
    UIImage *image=[UIImage imageNamed:self.curentConsum.imageStr];
    self.detailConsumImage.image=image;
    
    [self.detailConsumTextFild becomeFirstResponder];
    self.detailConsumTextFild.delegate=self;
    
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

- (IBAction)saveChenged:(UIButton *)sender {
   
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
           self.consumablesDetail=[car.consum allObjects];
            NSPredicate *predicat=[NSPredicate predicateWithFormat:@"nameConsum=%@", self.curentConsum.nameConsum];
            self.consumablesDetailPredicat=[self.consumablesDetail filteredArrayUsingPredicate:predicat];
            for (Consum *consum in self.consumablesDetailPredicat) {
                NSLog(@"consums count %lu",(unsigned long)self.consumablesDetailPredicat.count);
            valueBefor = [consum.valueConsum doubleValue];
            valueAfter =valueBefor + [self.detailConsumTextFild.text doubleValue];
            consum.valueConsum = [NSString stringWithFormat:@"%.2f",valueAfter];
            }
        }
    }
    
    self.detailConsumTextFild.text=@"";
    
    [_managedObjectContext save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
