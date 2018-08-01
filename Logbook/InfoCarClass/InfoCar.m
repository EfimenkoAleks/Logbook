//
//  InfoCar.m
//  Logbook
//
//  Created by mac on 08.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "InfoCar.h"

@implementation InfoCar

- (instancetype)initWithName:(NSString *)nameInfo andImage:(NSString *)imageInfo andDescription:(NSString *)descriptionInfoCar
{
    self = [super init];
    if (self) {
        self.nameInfo=nameInfo;
        self.imageInfo=imageInfo;
        self.descriptionInfoCar=descriptionInfoCar;
    }
    return self;
}

@end
