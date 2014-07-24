//
//  MapViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "SsgCommunicatorDelegate_CreateIssue.h"
#import "SsgCommunicatorDelegate.h"
#import "SsgCommunicatorDelegate_CreateIssue.h"
#import "MBProgressHUD.h"
#import "GAITrackedViewController.h"

@interface MapViewController : GAITrackedViewController <GMSMapViewDelegate, CLLocationManagerDelegate, SsgCommunicatorDelegate> {
	CLLocationManager *locationManager;
	BOOL first_marker;
	GMSMarker *marker;
	SsgCommunicatorDelegate_CreateIssue *_ssgCommunicatorCreateIssueDelegate;
	MBProgressHUD *hud;
}

//Property
@property (nonatomic, retain) IBOutlet GMSMapView *mapContainer;
@property (strong, nonatomic) IBOutlet UIButton *btnReportIssue;

//Actions
- (IBAction)btnCreateIssueOnTouch:(id)sender;



@end
