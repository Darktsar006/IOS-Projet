//
//  gpsCurrentPosition.h
//  Supinfo
//
//  Created by Local Administrator on 5/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#ifndef Supinfo_gpsCurrentPosition_h
#define Supinfo_gpsCurrentPosition_h

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface gpsCurrentPosition : NSObject {
    // Location GPS actuel
    
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    
    float latitude;
    float longitude;
}

- (void)startStandardUpdates;
- (float)getLatitude;
- (float)getLongitude;

@end

#endif
