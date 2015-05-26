//
//  supinfoViewController.m
//  Supinfo
//
//  Created by Local Administrator on 5/26/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "supinfoViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "Timer.h"
#import "ManageFile.h"
#import "gpsCurrentPosition.h"


@interface supinfoViewController ()<CLLocationManagerDelegate> {
    // Initialisation de la variable Timer
    Timer *timer;
    // Initialisation de la vatiable ManagerFile
    ManageFile *managerFile;
    // GPS Manager File
    gpsCurrentPosition *gps;
    
    int tape;
}
@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *longitude;

- (IBAction)buttonPress:(id)sender;
@end

@implementation supinfoViewController {
    CLLocationManager *localManager;
    
}

// UICatalogue
@synthesize departureLabel;
@synthesize engineStart;
@synthesize arrivalLabel;
@synthesize durationLabel;

@synthesize latitude;
@synthesize longitude;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    localManager = [[CLLocationManager alloc] init];
    
    // Mise de certain contenu à Hidden
    [self initialisation];
}

- (void)viewDidUnload
{
    [self setLatitude:nil];
    [self setLongitude:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)initialisation {
    // We Hide some content
    departureLabel.hidden = YES;
    arrivalLabel.hidden = YES;
    durationLabel.hidden = YES;
    
    // Initialisation de la variable timer
    timer = [[Timer alloc] init];
    // Initialisation de la vatiable ManagerFile
    managerFile = [[ManageFile alloc] init];
    [managerFile getFileContentInArray];
    // Initialisation des fonctions de GPS
    gps = [[gpsCurrentPosition alloc] init];
    [gps startStandardUpdates];
    
    // Variable tape when 0 : START Mode / 1 STOP Mode.
    tape = 0;
}

// Fin Location Mangement

- (IBAction)buttonPress:(id)sender {
    localManager.delegate = self;
    localManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [localManager startUpdatingLocation];
    
    
}


#pragma mark CLLocationManagerDelegate Methods

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error de localisation");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    CLLocation *currentLocation = newLocation;
    
    self.latitude.text = [NSString stringWithFormat: @"%.02f", currentLocation.coordinate.latitude];
    
    self.longitude.text = [NSString stringWithFormat: @"%.02f", currentLocation.coordinate.longitude];
}


// Fin d'import 
- (IBAction)startStopFunction:(id)sender {
    departureLabel.hidden = NO;
    
    //locationManager.delegate = self; Methode 2
    //locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //[locationManager startUpdatingLocation];
    
    if(tape == 0){
        // We call Start Timer message
        [timer startTimer];
        tape++;
        if(arrivalLabel.hidden == NO){
            arrivalLabel.hidden = YES;
        }
        if(durationLabel.hidden == NO){
            durationLabel.hidden = YES;
        }
        // Change Label Boutton to Stop
        
        
        
    }
    else {
        [timer stopTimer];
        tape = 0;
        arrivalLabel.hidden = NO;
        durationLabel.hidden = NO;
        
        
        durationLabel.text = [NSString stringWithFormat: @"Duration : %f s", [timer timeElapsedInSeconds] ];
        
        // Change Label Boutton to Start
    }
    
    //self.engineStart.currentTitle = @"Stop";
}

#pragma mark - Navigation
// Pour ajouter des nouvelles données entre les pages, je s'occupera de la Persistance plus tard.
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if (sender != self.saveButton) return;
    
    // On n'ajoute de cette façon les nounelle donnes
    self.toDoItem = [[FlightReviewList alloc] init];
    self.toDoItem.icaoArrival = durationLabel.text;
}


@end
