//
//  CameraViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController{

    BOOL camera_settings_state;

}

@property (strong, nonatomic) IBOutlet UIView *cameraSettingsContainer;

- (IBAction)btnSettingsOnTouch:(id)sender;
- (IBAction)btnOpenGalleryOnTouch:(id)sender;
- (IBAction)btnTakePictureOnTouch:(id)sender;

@end
