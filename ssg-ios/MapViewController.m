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
            
            CLLocation *newLocation = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(43.831183366766496, 18.308372497558594)
                                                                     altitude:0
                                                           horizontalAccuracy:0
                                                             verticalAccuracy:0
                                                                    timestamp:[NSDate date]];
            
            GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:newLocation.coordinate.latitude
                                                                    longitude:newLocation.coordinate.longitude
                                                                         zoom:15];
            //Set camera
            [self.mapContainer setCamera:camera];
            
            //Create marker
            marker = [[GMSMarker alloc] init];
            marker.position =  newLocation.coordinate;
            marker.snippet = @"Hello World";
            marker.icon=[UIImage imageNamed:@"map_marker.png"];
            marker.map=self.mapContainer;
            first_marker=true;
        }
    }
}

#pragma mark - GMSMapViewDelegate

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