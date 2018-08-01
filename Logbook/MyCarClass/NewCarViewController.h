//
//  NewCarViewController.h
//  Logbook
//
//  Created by mac on 30.04.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car+CoreDataClass.h"

@interface NewCarViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *model;
@property (weak, nonatomic) IBOutlet UITextField *subModel;
@property (weak, nonatomic) IBOutlet UITextField *mileage;
@property (weak, nonatomic) IBOutlet UIImageView *carNewImage;

- (IBAction)addCar:(UIButton *)sender;


@end
