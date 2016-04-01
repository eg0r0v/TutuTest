//
//  JSONParser.h
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParser : NSObject

+(JSONParser*)sharedParser;

-(NSArray*)parseFromCitiesArray;
-(NSArray*)parseToCitiesArray;

@end
