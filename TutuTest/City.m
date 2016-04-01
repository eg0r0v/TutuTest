//
//  City.m
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithCity:(City*)city
{
    self = [super init];
    if (self) {
        _cityId = city.cityId;
        _cityTitle = city.cityTitle;
        _districtTitle = city.districtTitle;
        _countryTitle = city.countryTitle;
        _regionTitle = city.regionTitle;
        _latitude = city.latitude;
        _longitude = city.longitude;
        _stations = city.stations;
    }
    return self;
}
@end
