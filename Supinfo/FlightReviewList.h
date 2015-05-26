//
//  FlightReviewList.h
//  Supinfo
//
//  Created by Local Administrator on 5/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightReviewList : NSObject

@property NSDate *Date;
@property NSString *icaoDeparture;
@property NSDate *hourDeparture;
@property NSDate *hourArrival;
@property NSString *icaoArrival;
@property NSDate *duration;

@end
