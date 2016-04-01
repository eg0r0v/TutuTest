//
//  JSONParser.m
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import "JSONParser.h"
#import "City.h"
#import "Station.h"

@interface JSONParser ()

@property (strong, nonatomic) NSArray* fromCitiesArray;
@property (strong, nonatomic) NSArray* toCitiesArray;

@end

@implementation JSONParser

+(JSONParser*)sharedParser {
    
    static JSONParser* sharedParser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedParser = [[JSONParser alloc] init];
    });
    return sharedParser;
}


-(NSArray*)parseFromCitiesArray {
    
    if (!self.fromCitiesArray) {
        [self parseGivenJSON];
    }
    return self.fromCitiesArray;
}

-(NSArray*)parseToCitiesArray {
    if (!self.toCitiesArray) {
        [self parseGivenJSON];
    }
    return self.toCitiesArray;
}


-(void)parseGivenJSON {
    
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"allStations" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath
                                                      encoding:NSUTF8StringEncoding
                                                         error:&error];
    
    NSDictionary* parsedJSON = (NSDictionary *)[NSJSONSerialization
                                                JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                                options:0 error:&error];
    
    self.fromCitiesArray = [self parseJSONCitiesArray:[parsedJSON objectForKey:@"citiesFrom"]];
    self.toCitiesArray = [self parseJSONCitiesArray:[parsedJSON objectForKey:@"citiesTo"]];
}

-(NSArray*)parseJSONCitiesArray:(NSArray*)cities {
    
    NSMutableArray* citiesArray = [NSMutableArray array];
    NSMutableArray * stations = [NSMutableArray array];
    for (NSDictionary* cityData in cities)
    {
        City* city = [[City alloc] init];
        city.cityId = [[cityData objectForKey:@"cityId"] integerValue];
        city.cityTitle = [cityData valueForKey:@"cityTitle"];
        
        city.countryTitle = [cityData valueForKey:@"countryTitle"];
        city.regionTitle = [cityData valueForKey:@"regionTitle"];
        city.districtTitle = [cityData valueForKey:@"districtTitle"];
        
        city.latitude = [[[cityData objectForKey:@"point"] objectForKey:@"latitude"] doubleValue];
        city.longitude = [cityData[@"point"][@"longitude"] doubleValue];
        
        [stations removeAllObjects];
        for (NSDictionary *stationData in [cityData objectForKey:@"stations"]) {
            Station* station = [[Station alloc] init];
            
            station.stationId = [[stationData objectForKey:@"stationId"] integerValue];
            station.stationTitle = [stationData valueForKey:@"stationTitle"];
            station.latitude = [[[stationData objectForKey:@"point"] objectForKey:@"latitude"] doubleValue];
            station.longitude = [stationData[@"point"][@"longitude"] doubleValue];
            
            [stations addObject:station];
        }
        city.stations = [NSArray arrayWithArray:stations];
        [citiesArray addObject:city];
    }
    return citiesArray;
}

@end
