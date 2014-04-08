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

@interface MapViewController : UIViewController<GMSMapViewDelegate,CLLocationManagerDelegate,SsgCommunicatorDelegate >{
    CLLocationManager *locationManager;
    BOOL first_marker;
    GMSMarker *marker ;
    
    SsgCommunicatorDelegate_CreateIssue * _ssgCommunicatorCreateIssueDelegate;
    
    
}


@property (nonatomic, retain) IBOutlet GMSMapView *mapContainer;

- (IBAction)btnCreateIssueOnTouch:(id)sender;


@end


