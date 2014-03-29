//
//  MapViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()


@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapContainer.delegate=self;
    [self initLocationManager];
}


-(void)initLocationManager{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    //locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
   // NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        if (!first_marker) {
            //Init camera
            GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:currentLocation.coordinate.latitude
                                                                    longitude:currentLocation.coordinate.longitude
                                                                         zoom:6];
            //Set camera
            [self.mapContainer setCamera:camera];
            
            //Create marker
            marker = [[GMSMarker alloc] init];
            marker.position =  currentLocation.coordinate;
            marker.snippet = @"Hello World";
            marker.icon=[UIImage imageNamed:@"map_marker.png"];
            marker.map=self.mapContainer;
            first_marker=true;
        }
       
        
    }
}

- (void) mapView:		(GMSMapView *) 	mapView
didTapAtCoordinate:		(CLLocationCoordinate2D) 	coordinate{
    
    [mapView clear];
    //Create marker
    marker = [[GMSMarker alloc] init];
    marker.position =  coordinate;
    marker.snippet = @"Hello World";
    marker.icon=[UIImage imageNamed:@"map_marker.png"];
    marker.map=mapView;
}


@end
