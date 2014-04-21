//
//  MapViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "MapViewController.h"
#import "SyncData.h"
#import "SsgAPI.h"
#import "MCLocalization.h"
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "ShareViewController.h"
#import "MCLocalization.h"
#import "MBProgressHUD.h"
#import "User.h"
#import "AppDelegate.h"


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
    
    NSLog(@"Kategorija: %@", [SyncData get].current_issue.category_id);
    NSLog(@"Grad: %@",[SyncData get].current_issue.city_id );
    NSLog(@"Title: %@",[SyncData get].current_issue.title);
    NSLog(@"Description: %@",[SyncData get].current_issue.descript);
    
    
    _ssgCommunicatorCreateIssueDelegate = [[SsgCommunicatorDelegate_CreateIssue alloc]init];
    _ssgCommunicatorCreateIssueDelegate.createIssue_delegate=self;
}

-(void)showProgressPopup:(BOOL)show{

    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = [MCLocalization stringForKey:@"progress_message"];
    [hud show:show];
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
  //  UIAlertView *errorAlert = [[UIAlertView alloc]
                              // initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  //  [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        if (!first_marker) {
            //Init camera
            
           // CLLocation *newLocation = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(43.831183366766496, 18.308372497558594)
                                                                   //  altitude:0
                                                         //  horizontalAccuracy:0
                                                           //  verticalAccuracy:0
                                                             //       timestamp:[NSDate date]];
            
            GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:newLocation.coordinate.latitude
                                                                    longitude:newLocation.coordinate.longitude
                                                                         zoom:15];
            //Set camera
            [self.mapContainer setCamera:camera];
            
            //Create marker
            marker = [[GMSMarker alloc] init];
            marker.position =  currentLocation.coordinate;
            marker.snippet = @"Hello World";
            marker.icon=[UIImage imageNamed:@"map_marker.png"];
            marker.map=self.mapContainer;
            first_marker=true;
            
            [SyncData get].current_issue.location_lat =@(currentLocation.coordinate.latitude);
            [SyncData get].current_issue.location_lng =@(currentLocation.coordinate.longitude);


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
    
    [SyncData get].current_issue.location_lat =@(coordinate.latitude);
    [SyncData get].current_issue.location_lng =@(coordinate.longitude);

}



//Class.m
- (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}
- (IBAction)btnCreateIssueOnTouch:(id)sender {
    
    [self showProgressPopup:YES];
    
    if (![self connected]) {
        // not connected
     [self showProgressPopup:NO];
       UIAlertView* infoAlertView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                   message:[MCLocalization stringForKey:@"no_internet"]
                                                  delegate:self
                                         cancelButtonTitle:[MCLocalization stringForKey:@"ok"]
                                         otherButtonTitles: nil];
        [infoAlertView show];
        
       // self.btnReportIssue.enabled=YES;
        
        

        
    } else {
        
        User* user = [self isUserLoggedWithEmailOrFacebook];
        
        [_ssgCommunicatorCreateIssueDelegate createIssue:[SyncData get].current_issue :[SyncData get].issue_image:user.access_token];
        
    }
    
}

#pragma SSG COMMUNICATOR DELEGATES
- (void)recivedData:(SyncData*)syncData{


}
- (void)fetchingData:(NSError *)error{


}

- (void)getResponse:(NSString*)code : (id)responseObject{


    
    if ([code isEqualToString:@"0"]) {
        
        //Hide progress dialog
       [self showProgressPopup:NO];
        
        //Set transition animation
        CATransition *transition = [CATransition animation];
        transition.duration = 0.45;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        transition.type = kCATransitionFromRight;
        [transition setType:kCATransitionPush];
        transition.subtype = kCATransitionFromRight;
        transition.delegate = self;
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        
        //Open share screen
        ShareViewController *main= [ self.storyboard instantiateViewControllerWithIdentifier:@"ShareViewController"];
        [self.navigationController pushViewController:main animated:NO];

        
    }
    else{
        //Hide progress dialog
         [self showProgressPopup:NO];
        
        //Show error
        NSDictionary * documents = [[NSDictionary alloc]init];
        documents=[responseObject objectForKey:@"status"];
        NSString* message=[documents objectForKey:@"message"];
        
        UIAlertView*  infoAlertView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                                 message:message
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles: nil];
        [infoAlertView show];
    
    }
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.btnReportIssue setBackgroundImage:[UIImage imageNamed:[MCLocalization stringForKey:@"report_issue_btn"]] forState:UIControlStateNormal];
    self.navigationItem.title = [MCLocalization stringForKey:@"map_bar"];
}

-(User*)isUserLoggedWithEmailOrFacebook {
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    
    
    //get object from database
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    
    for (User *user in fetchedObjects) {
        
        if (user.access_token!=nil) {
            
            return user;
        }
    }
    
    return nil;
}



-(void)viewDidAppear:(BOOL)animated{
     self.screenName=@"Map";
    [super viewDidAppear:YES];
}

@end