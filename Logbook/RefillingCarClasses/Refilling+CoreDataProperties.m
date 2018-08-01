//
//  Refilling+CoreDataProperties.m
//  Logbook
//
//  Created by mac on 19.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//
//

#import "Refilling+CoreDataProperties.h"

@implementation Refilling (CoreDataProperties)

+ (NSFetchRequest<Refilling *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Refilling"];
}

@dynamic literDiezel;
@dynamic literGas;
@dynamic literPetrol;
@dynamic valueDiezel;
@dynamic valueGas;
@dynamic valuePetrol;
@dynamic car;

@end
