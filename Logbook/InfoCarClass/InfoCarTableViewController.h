//
//  InfoCarTableViewController.h
//  Logbook
//
//  Created by mac on 08.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailInfoCarViewController.h"
#import "InfoCarTableViewCell.h"
#import "InfoCar.h"

@interface InfoCarTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic) NSArray *infoCarConsumables, *infoCarRepairs,*infoCarGroup;

@end
