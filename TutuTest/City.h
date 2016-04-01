//
//  City.h
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (assign, nonatomic) NSUInteger *cityId;
@property (strong, nonatomic) NSString *cityTitle;

@property (strong, nonatomic) NSString *countryTitle;
@property (strong, nonatomic) NSString *regionTitle;
@property (strong, nonatomic) NSString* districtTitle;

@property (assign, nonatomic) double latitude;
@property (assign, nonatomic) double longitude;

@property (strong, nonatomic) NSArray *stations;

- (instancetype)initWithCity:(City*)city;

@end
