//
//  Consum+CoreDataProperties.m
//  Logbook
//
//  Created by mac on 17.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//
//

#import "Consum+CoreDataProperties.h"

@implementation Consum (CoreDataProperties)

+ (NSFetchRequest<Consum *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Consum"];
}

@dynamic imageStr;
@dynamic nameConsum;
@dynamic valueConsum;
@dynamic car;

@end
