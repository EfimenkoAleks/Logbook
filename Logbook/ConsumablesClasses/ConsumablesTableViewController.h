//
//  ConsumablesTableViewController.h
//  Logbook
//
//  Created by mac on 03.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CunsumablesTableViewCell.h"
#import "Consum+CoreDataClass.h"
#import "Car+CoreDataClass.h"
#import <CoreData/CoreData.h>

@interface ConsumablesTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) NSFetchedResultsController<Consum *> *fetchedResultsController;
@property (nonatomic) NSArray *consums,*consumsNoSort;

@end
