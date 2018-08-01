//
//  RepairsTableViewController.h
//  Logbook
//
//  Created by mac on 04.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepairsTableViewCell.h"
#import "Repsir+CoreDataClass.h"
#import "Car+CoreDataClass.h"
#import <CoreData/CoreData.h>

@class DetailRepairsViewController;

@interface RepairsTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailRepairsViewController *detailViewController;
@property (strong, nonatomic) NSFetchedResultsController<Repsir *> *fetchedResultsController;
@property (nonatomic) NSArray *repairs, *repairsNoSort;

@end
