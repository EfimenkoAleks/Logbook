//
//  DetailRepairsViewController.h
//  Logbook
//
//  Created by mac on 04.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repsir+CoreDataClass.h"

@interface DetailRepairsViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *detailImageRepair;
@property (weak, nonatomic) IBOutlet UITextField *detailTextRepair;
@property(nonatomic) Repsir *repairDet;
@property (nonatomic) NSArray *repairDetail,*repairDetailPredicat;

- (IBAction)saveChengeRepair:(UIButton *)sender;

@end
