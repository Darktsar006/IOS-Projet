//
//  supinfoViewController.h
//  Supinfo
//
//  Created by Local Administrator on 5/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlightReviewList.h"

// GPS Current Position Librairy
// To Get position nearest airfield

@interface supinfoViewController : UIViewController {
    
}
// Proprieté créser dans xcode 6
/*
@property (weak, nonatomic) IBOutlet UIButton *engineStart;

@property (weak, nonatomic) IBOutlet UILabel *departureLabel;

@property (weak, nonatomic) IBOutlet UILabel *arrivalLabel;

@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
*/

// proprieté créer sous xcode 5 - VM Mountain lion

@property (weak, nonatomic) IBOutlet UILabel *departureLabel;

@property (weak, nonatomic) IBOutlet UILabel *arrivalLabel;

@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@property (weak, nonatomic) IBOutlet UIButton *engineStart;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property FlightReviewList *toDoItem;

// xcode 6 startStop Function
/*- (IBAction)startStopFunction:(id)sender;*/

// xcode 5 startStop Function
- (IBAction)startStopFunction:(id)sender;

@end
