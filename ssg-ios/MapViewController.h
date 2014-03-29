//
//  MapViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController : UIViewController<GMSMapViewDelegate,CLLocationManagerDelegate>{
 CLLocationManager *locationManager;
    BOOL first_marker;
    GMSMarker *marker ;
}


@property (nonatomic, retain) IBOutlet GMSMapView *mapContainer;



@end
