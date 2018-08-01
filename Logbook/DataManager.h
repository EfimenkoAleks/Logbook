//
//  DataManager.h
//  Logbook
//
//  Created by mac on 14.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DataManager : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

+(DataManager *) dataManager;

- (void)saveContext;


@end
