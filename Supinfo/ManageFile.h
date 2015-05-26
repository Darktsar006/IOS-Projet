//
//  ManageFile.h
//  Supinfo
//
//  Created by Local Administrator on 5/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManageFile : NSObject {
    // Variable du fichier raw-arfields
    NSMutableArray *icao;
    NSMutableArray *airport;
    NSMutableArray *latitude;
    NSMutableArray *longitude;
}

-(void) getFileContentInArray;

-(NSMutableArray *) getIcao;
-(NSMutableArray *) getAirport;
-(NSMutableArray *) getLatitude;
-(NSMutableArray *) getLongitude;

@end
