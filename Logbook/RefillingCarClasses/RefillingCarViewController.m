//
//  RefillingCarViewController.m
//  Logbook
//
//  Created by mac on 03.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "RefillingCarViewController.h"
#import "DataManager.h"

@interface RefillingCarViewController ()

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, strong) NSPersistentContainer *persistentContainer;

@end

@implementation RefillingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_managedObjectContext){
        _persistentContainer=[[DataManager dataManager] persistentContainer ];
        _managedObjectContext=_persistentContainer.viewContext;
    }
    [self.valueTextFild becomeFirstResponder];
    self.valueTextFild.delegate=self;
    self.litersTextFild.delegate=self;
    
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

- (IBAction)pourButton:(UIButton *)sender {
    
    double valueBefor,valueAfter,valueNow;
    NSError *error;
    NSFetchRequest *fechRequest=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Car" inManagedObjectContext:_managedObjectContext];
    [fechRequest setEntity:entity];
    NSArray *refillings=[_managedObjectContext executeFetchRequest:fechRequest error:&error];
    
    int keyCar=0;
    NSString *kCurentCar=@"kCurentCar";
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    keyCar=[[userDefault objectForKey:kCurentCar] intValue];
    
        for (Car *car in refillings) {
            if(car.namberCar == keyCar){
                
    if(self.fuelSegment.selectedSegmentIndex==0){
        if(([self.valueTextFild.text doubleValue] && [self.litersTextFild.text doubleValue]) > 0){
            valueBefor = car.refilling.valuePetrol ;
        valueNow = [self.valueTextFild.text doubleValue] * [self.litersTextFild.text doubleValue];
            valueAfter =valueBefor + valueNow;
            car.refilling.valuePetrol = valueAfter;
            valueBefor = car.refilling.literPetrol ;
            valueAfter =valueBefor + [self.litersTextFild.text doubleValue];
            car.refilling.literPetrol=valueAfter;
        }
        
    }
    if(self.fuelSegment.selectedSegmentIndex==1){
        if(([self.valueTextFild.text doubleValue] && [self.litersTextFild.text doubleValue]) > 0){
            valueBefor = car.refilling.valueDiezel ;
            valueNow = [self.valueTextFild.text doubleValue] * [self.litersTextFild.text doubleValue];
            valueAfter =valueBefor + valueNow;
            car.refilling.valueDiezel = valueAfter;
            valueBefor = car.refilling.literDiezel ;
            valueAfter =valueBefor + [self.litersTextFild.text doubleValue];
            car.refilling.literDiezel = valueAfter;
        }
    }
    if(self.fuelSegment.selectedSegmentIndex==2){
        if(([self.valueTextFild.text doubleValue] && [self.litersTextFild.text doubleValue]) > 0){
            valueBefor = car.refilling.valueGas ;
            valueNow = [self.valueTextFild.text doubleValue] * [self.litersTextFild.text doubleValue];
            valueAfter =valueBefor + valueNow;
            car.refilling.valueGas = valueAfter;
            valueBefor = car.refilling.literPetrol ;
            valueAfter =valueBefor + [self.litersTextFild.text doubleValue];
            car.refilling.literGas = valueAfter;
        }
    }
    
      [_managedObjectContext save:nil];
    }
    }
    
    self.valueTextFild.text=@"";
    self.litersTextFild.text=@"";
     [self dismissViewControllerAnimated:YES completion:nil];
}

@end
