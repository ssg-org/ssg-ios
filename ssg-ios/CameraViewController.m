//
//  CameraViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "CameraViewController.h"
#import "SyncData.h"
#import "DescriptionViewController.h"
#import "MCLocalization.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
    
    // Init camera capturing
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        //Init cameras
        [self initBackCamera];
        [self initFrontCamera];
        
        //Start default camera
        [self startBackCamera];
        
    }
    else {
        
        infoAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        //[infoAlertView show];
       // return;
    }
    
    //Create  next button
    self.navigationItem.rightBarButtonItem = [self createNextButton];
    
  
    
}


#pragma mark - INIT FUNCTION FOR CAMERA
-(void)initFrontCamera{
    
    //Init session front
    session_front = [[AVCaptureSession alloc] init];
    session_front.sessionPreset = AVCaptureSessionPresetMedium;
    
    //Init preview  layer for  front camera
    preview_layer_front= [[AVCaptureVideoPreviewLayer alloc] initWithSession:session_front];
    preview_layer_front.frame = self.imagePreview.bounds;////////////////////////
    preview_layer_front.videoGravity = AVLayerVideoGravityResizeAspectFill;
    preview_layer_front.bounds = self.imagePreview.bounds;////////////////////
    
    //Init front camera device
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == AVCaptureDevicePositionFront)
        {
            device_front=device;
        }
    }
    NSError *er= nil;
    inputdevice_front= [AVCaptureDeviceInput deviceInputWithDevice:device_front error:&er];
    
    
    [session_front addInput:inputdevice_front];
    // Output
    stillImageOutputFront = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG,AVVideoCodecKey, nil];
    [stillImageOutputFront setOutputSettings:outputSettings];
    [session_front addOutput:stillImageOutputFront];
}

-(void)initBackCamera{
    
    //Init session back
    session_back = [[AVCaptureSession alloc] init];
    session_back.sessionPreset = AVCaptureSessionPresetMedium;
    
    //Init preview layer for back camera
    preview_layer_back= [[AVCaptureVideoPreviewLayer alloc] initWithSession:session_back];
    preview_layer_back.frame = self.imagePreview.bounds;////////////////////////
    preview_layer_back.videoGravity = AVLayerVideoGravityResizeAspectFill;
    preview_layer_back.bounds = self.imagePreview.bounds;/////////////////////
    
    //Init back camera device
    device_back = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    inputdevice_back= [AVCaptureDeviceInput deviceInputWithDevice:device_back error:&error];
    
    
    // Output
    [session_back addInput:inputdevice_back];
    stillImageOutputBack = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [stillImageOutputBack setOutputSettings:outputSettings];
    [session_back addOutput:stillImageOutputBack];
    
}



#pragma mark - START FUNCTION FOR CAMERA

- (void)startFrontCamera {
    
    [session_back stopRunning];//STOP back camera
    [self.imagePreview.layer addSublayer:preview_layer_front];//////////////////
    
    if (!inputdevice_front) {
        // Handle the error appropriately.
        NSLog(@"ERROR: trying to open camera" );
    }
    else
    {
        [session_front startRunning];
    }
}

-(void)startBackCamera {
    
    [session_front stopRunning]; //STOP front camera
    [self.imagePreview.layer addSublayer:preview_layer_back];/////////////////////////
    
    if (!inputdevice_back) {
        // Handle the error appropriately.
        NSLog(@"ERROR: trying to open camera...");
    }
    else
    {
        [session_back startRunning];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)setPreviewImage:(UIImage*)image {
    
   // CGSize imageSize = image.size;
//    CGFloat width = imageSize.width;
//    CGFloat height = imageSize.height;
//    if (width != height) {
//        CGFloat newDimension = MIN(width, height);
//        CGFloat widthOffset = (width - newDimension) / 2;
//        CGFloat heightOffset = (height - newDimension) / 2;
    
        //UIGraphicsBeginImageContextWithOptions(CGSizeMake(newDimension, newDimension), NO, 0.);
        
//        [image drawAtPoint:CGPointMake(-widthOffset, -heightOffset)
//                 blendMode:kCGBlendModeCopy
//                     alpha:1.];
       // image = UIGraphicsGetImageFromCurrentImageContext();
      //  UIGraphicsEndImageContext();
   // }
    
    self.imagePreview.image = image;
    
}

- (IBAction)btnCameraAutoOnTouch:(id)sender {
    
    
}

- (IBAction)btnSettingsOnTouch:(id)sender {
    
    camera_settings_state=camera_settings_state?false:true;
    
    if (camera_settings_state) {
        
        self.cameraSettingsContainer.hidden=NO;
    
    }
    else{
    
        self.cameraSettingsContainer.hidden=YES;
    }
    
}

- (IBAction)btnOpenGalleryOnTouch:(id)sender {
    
    
}

- (IBAction)btnTakePictureOnTouch:(id)sender {
    
    //Activate Flash and Torch
    
    if (!isFront) {
        if ([device_back hasTorch] && [device_back hasFlash]  &&  isFlashActive==true ){
            
            if (device_back.torchMode == AVCaptureTorchModeOff) {
                
                [session_back beginConfiguration];
                [device_back lockForConfiguration:nil];
                [device_back setTorchMode:AVCaptureTorchModeOn];
                [device_back setFlashMode:AVCaptureFlashModeOn];
                [device_back unlockForConfiguration];
                [session_back commitConfiguration];
            }
        }
        else
        {
            if ([device_back hasTorch]) {
                [session_back beginConfiguration];
                [device_back lockForConfiguration:nil];
                [device_back setTorchMode:AVCaptureTorchModeOff];
                [device_back setFlashMode:AVCaptureFlashModeOff];
                [device_back unlockForConfiguration];
                [session_back commitConfiguration];
            }
            
        }
    }
    
    
    if (isFront) {
        AVCaptureConnection *videoConnection = nil;
        for (AVCaptureConnection *connection in stillImageOutputFront.connections){
            for (AVCaptureInputPort *port in [connection inputPorts]){
                
                if ([[port mediaType] isEqual:AVMediaTypeVideo]){
                    
                    videoConnection = connection;
                    
                    
                    break;
                }
            }
            if (videoConnection) {
                break;
            }
        }
        
        [self hideCameraButtons:TRUE];
        NSLog(@"about to request a capture from: %@", stillImageOutputFront);
        
        [stillImageOutputFront captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error) {
            
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
            UIImage *image = [[UIImage alloc] initWithData:imageData];
            
            [self setPreviewImage:image];
            
            //Stop camera session
            [session_front stopRunning];
            [session_back stopRunning];
        }];
        
    }
    else
    {
        AVCaptureConnection *videoConnection = nil;
        for (AVCaptureConnection *connection in stillImageOutputBack.connections){
            for (AVCaptureInputPort *port in [connection inputPorts]){
                
                if ([[port mediaType] isEqual:AVMediaTypeVideo]){
                    
                    videoConnection = connection;
                    
                    
                    break;
                }
            }
            if (videoConnection) {
                break;
            }
        }
        
        [self hideCameraButtons:TRUE];
        NSLog(@"about to request a capture from: %@", stillImageOutputBack);
        
        [stillImageOutputBack captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error) {
            
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
            UIImage *image = [[UIImage alloc] initWithData:imageData];
            
            [self setPreviewImage:image];
            
            //Stop camera session
            [session_front stopRunning];
            [session_back stopRunning];
        }];
        
    }
    
}


- (IBAction)btnCameraToggleOnTouch:(id)sender {
    
    if(isFront){
        [self startBackCamera];
        isFront=false;
    }
    else
    {
        [self startFrontCamera];
        isFront=true;
    }
}

- (IBAction)btnDeclinePhotoOnTouch:(id)sender {
    
    [self hideCameraButtons:FALSE];
    //[session startRunning];
    if (isFront) {
        [session_front startRunning];
    }
    else{
        [session_back startRunning];
    }
    
}

- (IBAction)btnAcceptPhotoOnTouch:(id)sender {
    
    //Accept photo from camera
    [SyncData get].issue_image=[[UIImage alloc]init];
    [SyncData get].issue_image=self.imagePreview.image;
    
    
   
    DescriptionViewController *descriptionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DescriptionViewController" ];
    [self.navigationController pushViewController:descriptionViewController animated:YES];
    
    [self btnDeclinePhotoOnTouch:self];
    
}

- (void)hideCameraButtons:(BOOL)show {
    self.btnTakePhoto.hidden = show;
    self.btnGallery.hidden = show;
    self.btnSettings.hidden=show;
    self.btnAcceptPhoto.hidden = !show;
    self.btnDeclinePhoto.hidden = !show;
    button.hidden=!show;
   
    if (!show) {
        
        self.imagePreview.image = NULL;
    }
}


-(void)viewWillAppear:(BOOL)animated{
    
 self.navigationItem.backBarButtonItem.title= [MCLocalization stringForKey:@"back"];
    
}

-(void)viewWillLayoutSubviews{
[[self navigationController] setNavigationBarHidden:NO animated:YES];
    
}

UIButton *button;
-(UIBarButtonItem*)createNextButton{
    
    //Get icon
    UIImage *nextIcon = [UIImage imageNamed:@"next_icon.png"];
    
    //Create button
    button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setImage:nextIcon forState:UIControlStateNormal];
    [button setTitle:[MCLocalization stringForKey:@"next"] forState:UIControlStateNormal];
     //self.navigationItem.backBarButtonItem.title=[[NSBundle mainBundle] localizedStringForKey:@"next" value:@"" table:nil] forState:UIControlStateNormal];
    
    //Set button selector function
    [button addTarget:self action:@selector(Next)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 2.5f, 75, 31)];
    button.titleLabel.font=[UIFont fontWithName:@"FuturaStd-Book" size:14.0f];
    
    //set image position
    button.imageEdgeInsets = UIEdgeInsetsMake(0., button.frame.size.width - (nextIcon.size.width  ), 0., 0.);
    button.titleEdgeInsets = UIEdgeInsetsMake(0., 0., 0., nextIcon.size.width);
    
    //Create button View - set  UIBarButtonItem custom position
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 63, 33)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 5, 0);
    [backButtonView addSubview:button];
    
    //Create UIBarButtonItem
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    
    button.hidden=YES;
    return barButton;
    
}

-(void)Next{

//    if ([SyncData get].issue_image!=nil) {
//        
//        DescriptionViewController *descriptionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DescriptionViewController" ];
//        [self.navigationController pushViewController:descriptionViewController animated:YES];
//    }
//    else{
//        infoAlertView = [[UIAlertView alloc] initWithTitle:@"Info"
//                                                   message:[MCLocalization stringForKey:@"camera_validation"]
//                                                  delegate:self
//                                         cancelButtonTitle:[MCLocalization stringForKey:@"ok"]
//                                         otherButtonTitles: nil];
//        [infoAlertView show];
//
//    
//    
//    }
    
    
    //Accept photo from camera
    [SyncData get].issue_image=[[UIImage alloc]init];
    [SyncData get].issue_image=self.imagePreview.image;
    
    
    
    DescriptionViewController *descriptionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DescriptionViewController" ];
    [self.navigationController pushViewController:descriptionViewController animated:YES];
    
    [self btnDeclinePhotoOnTouch:self];

    
    
}




@end
