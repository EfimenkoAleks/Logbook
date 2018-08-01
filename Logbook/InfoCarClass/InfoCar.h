//
//  InfoCar.h
//  Logbook
//
//  Created by mac on 08.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoCar : NSObject

@property(nonatomic) NSString *nameInfo,*imageInfo,*descriptionInfoCar;

-(instancetype) initWithName:(NSString*)nameInfo andImage:(NSString*)imageInfo andDescription:(NSString*)descriptionInfoCar;

@end
