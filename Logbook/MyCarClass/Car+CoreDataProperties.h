//
//  Car+CoreDataProperties.h
//  Logbook
//
//  Created by mac on 19.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//
//

#import "Car+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *mileage;
@property (nonatomic) int32_t namberCar;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *subName;
@property (nullable, nonatomic, retain) NSSet<Consum *> *consum;
@property (nullable, nonatomic, retain) Refilling *refilling;
@property (nullable, nonatomic, retain) NSSet<Repsir *> *repsir;

@end

@interface Car (CoreDataGeneratedAccessors)

- (void)addConsumObject:(Consum *)value;
- (void)removeConsumObject:(Consum *)value;
- (void)addConsum:(NSSet<Consum *> *)values;
- (void)removeConsum:(NSSet<Consum *> *)values;

- (void)addRepsirObject:(Repsir *)value;
- (void)removeRepsirObject:(Repsir *)value;
- (void)addRepsir:(NSSet<Repsir *> *)values;
- (void)removeRepsir:(NSSet<Repsir *> *)values;

@end

NS_ASSUME_NONNULL_END
