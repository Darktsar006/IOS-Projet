//
//  gpsCurrentPosition.m
//  Supinfo
//
//  Created by Local Administrator on 5/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "gpsCurrentPosition.h"

@interface gpsCurrentPosition()<CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@end

@implementation gpsCurrentPosition

-(id) init {
    self = [super init];
    
    if(self){
        locationManager = [[CLLocationManager alloc] init];
        latitude = 0.0f;
        longitude = 0.0f;
    }
    
    return self;
}

// Location Service
- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500; // meters
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    /*if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }*/
    
    [locationManager startUpdatingLocation];
    
    NSLog(@"Here 1");
    
}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    
    NSLog(@"Here 3");
    
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    //arrivalLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
    if (abs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
        
        //arrivalLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
        //longi = location.coordinate.longitude;
    }
    
    latitude = location.coordinate.latitude;
    longitude = location.coordinate.longitude;
}

-(float)getLatitude {
    return latitude;
}

-(float)getLongitude {
    return longitude;
}

@end