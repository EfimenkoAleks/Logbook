//
//  Repsir+CoreDataProperties.h
//  Logbook
//
//  Created by mac on 17.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//
//

#import "Repsir+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Repsir (CoreDataProperties)

+ (NSFetchRequest<Repsir *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageRepair;
@property (nullable, nonatomic, copy) NSString *nameRepair;
@property (nullable, nonatomic, copy) NSString *valueRepair;
@property (nullable, nonatomic, retain) Car *car;

@end

NS_ASSUME_NONNULL_END
