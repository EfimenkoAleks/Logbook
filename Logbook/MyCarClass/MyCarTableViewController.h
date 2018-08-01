//
//  MyCarTableViewController.h
//  Logbook
//
//  Created by mac on 12.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCarCellTableViewCell.h"
#import "Car+CoreDataClass.h"

@class NewCarViewController;

@interface MyCarTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NewCarViewController *detailViewController;
@property (strong, nonatomic) NSFetchedResultsController<Car *> *fetchedResultsController;

@end
