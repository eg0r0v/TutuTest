//
//  Station.h
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Station : NSObject

@property (assign, nonatomic) NSUInteger *stationId;
@property (strong, nonatomic) NSString *stationTitle;

@property (assign, nonatomic) double latitude;
@property (assign, nonatomic) double longitude;

@end
