//
//  NewCarViewController.m
//  Logbook
//
//  Created by mac on 30.04.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "NewCarViewController.h"
#import "MyCarTableViewController.h"
#import "DataManager.h"
#import "Repsir+CoreDataClass.h"
#import "Consum+CoreDataClass.h"
#import "Refilling+CoreDataClass.h"

@interface NewCarViewController ()

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, strong) NSPersistentContainer *persistentContainer;

@end

@implementation NewCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_managedObjectContext){
        _persistentContainer=[[DataManager dataManager] persistentContainer ];
        _managedObjectContext=_persistentContainer.viewContext;
    }
    
    [self.model becomeFirstResponder];
    self.mileage.delegate=self;
    
    UIImage *image=[UIImage imageNamed:@"newCar"];
    self.carNewImage.image=image;
    
     UIColor *color=[UIColor colorWithRed:0.4 green:0.8 blue:0.1 alpha:1];
    self.view.backgroundColor=color;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addCar:(UIButton *)sender {
    
    if([self.model.text length] && [self.subModel.text length] && [self.mileage.text length]){
    
    Car *newCar = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:_managedObjectContext];
    newCar.name=self.model.text;
    newCar.subName=self.subModel.text;
    newCar.mileage=self.mileage.text;
    
    Repsir *rep1 = [NSEntityDescription insertNewObjectForEntityForName:@"Repsir" inManagedObjectContext:_managedObjectContext];
    rep1.nameRepair=@"Ходовая";
    rep1.imageRepair=@"xodova";
    rep1.valueRepair=@"0";
    Repsir *rep2 = [NSEntityDescription insertNewObjectForEntityForName:@"Repsir" inManagedObjectContext:_managedObjectContext];
    rep2.nameRepair=@"Двигатель";
    rep2.imageRepair=@"dvigatel";
    rep2.valueRepair=@"0";
    Repsir *rep3 = [NSEntityDescription insertNewObjectForEntityForName:@"Repsir" inManagedObjectContext:_managedObjectContext];
    rep3.nameRepair=@"Кузов";
    rep3.imageRepair=@"kuzov";
    rep3.valueRepair=@"0";
    Repsir *rep4 = [NSEntityDescription insertNewObjectForEntityForName:@"Repsir" inManagedObjectContext:_managedObjectContext];
    rep4.nameRepair=@"Элементы салона";
    rep4.imageRepair=@"salon";
    rep4.valueRepair=@"0";
    Repsir *rep5 = [NSEntityDescription insertNewObjectForEntityForName:@"Repsir" inManagedObjectContext:_managedObjectContext];
    rep5.nameRepair=@"Другое";
    rep5.imageRepair=@"drugoe";
    rep5.valueRepair=@"0";
    
    newCar.repsir=[NSSet setWithObjects:rep1,rep2,rep3,rep4,rep5, nil];
    
    Consum *cons1 = [NSEntityDescription insertNewObjectForEntityForName:@"Consum" inManagedObjectContext:_managedObjectContext];
    cons1.nameConsum=@"Машинное масло";
    cons1.imageStr= @"motor_oil";
    cons1.valueConsum=@"0";
    Consum *cons2 = [NSEntityDescription insertNewObjectForEntityForName:@"Consum" inManagedObjectContext:_managedObjectContext];
    cons2.nameConsum=@"Различные фильтры (воздушные, масляные и топливные)";
    cons2.imageStr= @"filtr";
    cons2.valueConsum=@"0";
    Consum *cons3 = [NSEntityDescription insertNewObjectForEntityForName:@"Consum" inManagedObjectContext:_managedObjectContext];
    cons3.nameConsum=@"Ремни";
    cons3.imageStr= @"remni";
    cons3.valueConsum=@"0";
    Consum *cons4 = [NSEntityDescription insertNewObjectForEntityForName:@"Consum" inManagedObjectContext:_managedObjectContext];
    cons4.nameConsum=@"Свечи зажигания";
    cons4.imageStr= @"svechi";
    cons4.valueConsum=@"0";
    Consum *cons5 = [NSEntityDescription insertNewObjectForEntityForName:@"Consum" inManagedObjectContext:_managedObjectContext];
    cons5.nameConsum=@"Антифриз и тормозная жидкость";
    cons5.imageStr= @"gidkosti";
    cons5.valueConsum=@"0";
    
    newCar.consum=[NSSet setWithObjects:cons1,cons2,cons3,cons4,cons5, nil];
    
    Refilling *refilling = [NSEntityDescription insertNewObjectForEntityForName:@"Refilling" inManagedObjectContext:_managedObjectContext];
    refilling.valuePetrol=0.0;
    refilling.literPetrol=0.0;
    refilling.valueGas=0.0;
    refilling.literGas=0.0;
    refilling.valueDiezel=0.0;
    refilling.literDiezel=0.0;
    
    newCar.refilling=refilling;
    
    int keyCar=1;
    NSString *kKeyNewCar=@"kKeyNewCar";
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    if([userDefault objectForKey:kKeyNewCar]){
    keyCar=[[userDefault objectForKey:kKeyNewCar] intValue];
        keyCar++;
        newCar.namberCar=keyCar;
    [userDefault setObject:[NSNumber numberWithInt:keyCar] forKey:kKeyNewCar];
    
    [userDefault synchronize];
    }
    else {
        newCar.namberCar=keyCar;
        [userDefault setObject:[NSNumber numberWithInt:keyCar] forKey:kKeyNewCar];
        
        [userDefault synchronize];
    }
    
    NSLog(@"count %lu ",newCar.repsir.count);
    
    [_managedObjectContext save:nil];
        
    }
    
}

@end
