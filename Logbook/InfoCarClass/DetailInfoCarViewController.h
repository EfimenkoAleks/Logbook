//
//  DetailInfoCarViewController.h
//  Logbook
//
//  Created by mac on 08.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoCar.h"

@interface DetailInfoCarViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *detailInfoCarTextView;
@property (nonatomic) InfoCar *infoCar;

@end
