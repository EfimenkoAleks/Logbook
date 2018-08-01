//
//  DetailConsumablesViewController.h
//  Logbook
//
//  Created by mac on 03.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Consum+CoreDataClass.h"

@interface DetailConsumablesViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *detailConsumImage;
@property (weak, nonatomic) IBOutlet UITextField *detailConsumTextFild;
@property (nonatomic) Consum *curentConsum;
@property (nonatomic) NSArray *consumablesDetail,*consumablesDetailPredicat;

- (IBAction)saveChenged:(UIButton *)sender;

@end
