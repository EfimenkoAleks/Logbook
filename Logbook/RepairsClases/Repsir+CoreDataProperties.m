//
//  Repsir+CoreDataProperties.m
//  Logbook
//
//  Created by mac on 17.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//
//

#import "Repsir+CoreDataProperties.h"

@implementation Repsir (CoreDataProperties)

+ (NSFetchRequest<Repsir *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Repsir"];
}

@dynamic imageRepair;
@dynamic nameRepair;
@dynamic valueRepair;
@dynamic car;

@end
