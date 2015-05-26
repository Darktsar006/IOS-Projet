//
//  ManageFile.m
//  Supinfo
//
//  Created by Local Administrator on 5/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ManageFile.h"

@implementation ManageFile

- (id) init {
    self = [super init];
    if (self != nil) {
        // Variable du fichier raw-arfiels.txt
        icao = [NSMutableArray array];
        airport = [NSMutableArray array];
        latitude = [NSMutableArray array];
        longitude = [NSMutableArray array];
    }
    return self;
}

-(void) getFileContentInArray {
    NSCharacterSet *newlineCharSet = [NSCharacterSet newlineCharacterSet];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"raw-airfields" ofType:@"txt"];
    NSString* fileContents = [NSString stringWithContentsOfFile:filePath];
    
    
    NSArray *fileContentSplitInArray = [fileContents componentsSeparatedByCharactersInSet:newlineCharSet];
    
    if (fileContentSplitInArray) {
        NSUInteger count = [fileContentSplitInArray count];
        
        for(int i = 0; i< count-1; i++){
            // On recupère une ligne du fichier
            NSString *contentTemp = [fileContentSplitInArray objectAtIndex: i];
            
            
            
            /* On Split cette ligne dans un tableau (A travers le premier grand separateur ','
             NSArray *split = [contentTemp componentsSeparatedByString:@", "];*/
            
            NSArray *split = [contentTemp componentsSeparatedByString: @", "];
            NSString *airfieldInfo = [split objectAtIndex: 0];
            
            
            
            // Rajout de la chaine ICAO & Airport en mode décomposition.
            NSArray *split2 = [airfieldInfo componentsSeparatedByString:@" - "];
            [icao addObject: [split2 objectAtIndex: 0]]; // Cette chaine contient le code ICAO et le nom de l'aéroport.
            [airport addObject:[split objectAtIndex: 1]];
            
            
            
            
            // Recuperer dans la chaine principale Split1.
            [latitude addObject: [split objectAtIndex: 1]];
            [longitude addObject: [split objectAtIndex: 2]];
        }
    }
    //return fileContentSplitInArray;
}

-(NSMutableArray *) getIcao {
    return icao;
}

-(NSMutableArray *) getAirport {
    return airport;
}

-(NSMutableArray *) getLatitude {
    return latitude;
}

-(NSMutableArray *) getLongitude {
    return longitude;
}

@end
