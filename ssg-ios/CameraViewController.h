//
//  CameraViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    //Flag for camera state
    BOOL camera_settings_state;
    
    
    AVCaptureStillImageOutput *stillImageOutputFront;
    AVCaptureStillImageOutput *stillImageOutputBack;
    
    UIImagePickerController *imagePicker;
   
    
    //front
    AVCaptureDeviceInput *inputdevice_front;
    AVCaptureDevice* device_front;
    AVCaptureVideoPreviewLayer* preview_layer_front;
    AVCaptureSession *session_front;
    
    //back
    AVCaptureDeviceInput *inputdevice_back;
    AVCaptureDevice* device_back;
    AVCaptureVideoPreviewLayer* preview_layer_back;
    AVCaptureSession *session_back;
    
    bool isFront;
    bool isFlashActive;

    UIAlertView *infoAlertView;
    
   
}

@property (strong, nonatomic) IBOutlet UIView *cameraSettingsContainer;

@property (strong,nonatomic) IBOutlet UIImageView *imagePreview;

- (IBAction)btnCameraAutoOnTouch:(id)sender;

- (IBAction)btnSettingsOnTouch:(id)sender;
- (IBAction)btnOpenGalleryOnTouch:(id)sender;
- (IBAction)btnTakePictureOnTouch:(id)sender;
- (IBAction)btnCameraToggleOnTouch:(id)sender;
- (IBAction)btnDeclinePhotoOnTouch:(id)sender;
- (IBAction)btnAcceptPhotoOnTouch:(id)sender;



//PROPERTY
@property (strong, nonatomic) IBOutlet UIButton *btnGallery;
@property (strong, nonatomic) IBOutlet UIButton *btnTakePhoto;
@property (strong, nonatomic) IBOutlet UIButton *btnSettings;
@property (strong, nonatomic) IBOutlet UIButton *btnDeclinePhoto;
@property (strong, nonatomic) IBOutlet UIButton *btnAcceptPhoto;

@property (strong, nonatomic) IBOutlet UIView *cameraPreview;






@end
