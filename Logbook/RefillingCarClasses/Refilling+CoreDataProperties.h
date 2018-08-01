//
//  Refilling+CoreDataProperties.h
//  Logbook
//
//  Created by mac on 19.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//
//

#import "Refilling+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Refilling (CoreDataProperties)

+ (NSFetchRequest<Refilling *> *)fetchRequest;

@property (nonatomic) double literDiezel;
@property (nonatomic) double literGas;
@property (nonatomic) double literPetrol;
@property (nonatomic) double valueDiezel;
@property (nonatomic) double valueGas;
@property (nonatomic) double valuePetrol;
@property (nullable, nonatomic, retain) Car *car;

@end

NS_ASSUME_NONNULL_END
