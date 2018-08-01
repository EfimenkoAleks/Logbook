//
//  RefillingCarViewController.h
//  Logbook
//
//  Created by mac on 03.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Refilling+CoreDataClass.h"
#import "Car+CoreDataClass.h"

@interface RefillingCarViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *fuelSegment;
@property (weak, nonatomic) IBOutlet UITextField *valueTextFild;
@property (weak, nonatomic) IBOutlet UITextField *litersTextFild;

- (IBAction)pourButton:(UIButton *)sender;


@end
