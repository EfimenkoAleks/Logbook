//
//  CostsTableViewController.h
//  Logbook
//
//  Created by mac on 04.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car+CoreDataClass.h"

@interface CostsTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) NSArray *costs,*fuelings,*consumables,*repairs,*fuelingsDetail,*consumablesDetail,*repairsDetail,*consumablesDetailNoSort,*repairsDetailNoSort;

@end
