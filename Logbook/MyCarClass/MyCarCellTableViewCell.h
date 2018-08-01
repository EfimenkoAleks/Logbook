//
//  MyCarCellTableViewCell.h
//  Logbook
//
//  Created by mac on 12.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCarCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *myModel;
@property (weak, nonatomic) IBOutlet UILabel *mySubModel;
@property (weak, nonatomic) IBOutlet UILabel *myMileage;

@end
