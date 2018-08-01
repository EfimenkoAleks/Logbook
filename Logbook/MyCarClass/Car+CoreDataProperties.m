//
//  Car+CoreDataProperties.m
//  Logbook
//
//  Created by mac on 19.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//
//

#import "Car+CoreDataProperties.h"

@implementation Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Car"];
}

@dynamic mileage;
@dynamic namberCar;
@dynamic name;
@dynamic subName;
@dynamic consum;
@dynamic refilling;
@dynamic repsir;

@end
