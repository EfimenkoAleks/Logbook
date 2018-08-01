//
//  Consum+CoreDataProperties.h
//  Logbook
//
//  Created by mac on 17.06.2018.
//  Copyright © 2018 mac. All rights reserved.
//
//

#import "Consum+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Consum (CoreDataProperties)

+ (NSFetchRequest<Consum *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageStr;
@property (nullable, nonatomic, copy) NSString *nameConsum;
@property (nullable, nonatomic, copy) NSString *valueConsum;
@property (nullable, nonatomic, retain) Car *car;

@end

NS_ASSUME_NONNULL_END
