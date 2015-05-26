//
//  Timer.h
//  Supinfo
//
//  Created by Local Administrator on 5/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef Supinfo_Timer_h
#define Supinfo_Timer_h

#import <Foundation/Foundation.h>

@interface Timer : NSObject {
    NSDate *start;
    NSDate *end;
}

- (void) startTimer;
- (void) stopTimer;
- (double) timeElapsedInSeconds;
- (double) timeElapsedInMilliseconds;
- (double) timeElapsedInMinutes;

@end

#endif
