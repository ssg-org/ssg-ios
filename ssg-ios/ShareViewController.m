//
//  ShareViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "ShareViewController.h"
#import "CameraViewController.h"
#import "DescriptionViewController.h"
#import "MapViewController.h"
#import <Social/Social.h>
#import "MCLocalization.h"
#import "AppDelegate.h"
#import "User.h"


@interface ShareViewController ()

@end

@implementation ShareViewController

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{

    
    self.navigationItem.title = [MCLocalization stringForKey:@"share_bar"];

}


-(void)setData {


    self.lblTitle.text=[SyncData get].current_issue.title;
    self.txtDescription.text=[SyncData get].current_issue.descript;
    [self.imgIssue setImage:[SyncData get].issue_image];
    [self.txtDescription setText:[SyncData get].current_issue.descript];
    [self.lblCategoryName setText:[SyncData get].current_issue.category_name];
    
    
    User* currentUser = [self isUserLoggedWithEmailOrFacebook];
    
    NSMutableString * firstlastname=[[NSMutableString alloc]init];
    [firstlastname appendString:currentUser.firstname];
    [firstlastname appendString:@" "];
    [firstlastname appendString:currentUser.lastname];
    [self.lblUsername setText:firstlastname ];
    
    NSURL * imageURL = [NSURL URLWithString:currentUser.profile_picture];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    [self.imgUser setImage:image];


}

-(void)createShareButton{

   self.navigationItem.hidesBackButton = YES;
    
    UIImage* image3 = [UIImage imageNamed:@"share_button.png"];
    CGRect frameimg = CGRectMake(0, 0, image3.size.width, image3.size.height);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(shareIssue)
         forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=mailbutton;

}


-(void)shareIssue{

    NSString* someText = [SyncData get].issueResponseUrl;
    NSArray* dataToShare = @[someText];  // ...or whatever pieces of data you want to share.
    UIActivityViewController* activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:dataToShare
                                      applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:^{}];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) { // if iOS 7
        self.edgesForExtendedLayout = UIRectEdgeNone; //layout adjustements
    }
    
    [self createShareButton];
    [self setData];
}

-(void)viewDidLayoutSubviews{

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)createNewIssue:(id)sender {

    //Remove info for last issue
    [SyncData get].issue_image=nil;
    [SyncData get].current_issue.city_id=nil;
    [SyncData get].current_issue.category_id=nil;
    

    NSInteger count=[[self.navigationController viewControllers] count];
    
    [self.navigationController  popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-4 ] animated:YES];
}
- (IBAction)btnFacebookShare:(id)sender {
    
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *fbSheet = [SLComposeViewController
                                            composeViewControllerForServiceType:SLServiceTypeFacebook];
       [fbSheet setInitialText: [SyncData get].issueResponseUrl];
       // if (![fbSheet addImage:self.imageToShare]) {
            NSLog(@"Unable to add the image!");
      //  }
        [self presentViewController:fbSheet animated:YES completion:nil];
    }
    else {
        NSLog(@"FB not Installed");
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                              message:@"Cannot share - no Facebook app installed."
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
        
    }

    
}

- (IBAction)btnTwitterShare:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [tweetSheet setInitialText:[SyncData get].issueResponseUrl];
        
        //if (![tweetSheet addImage:self.imageToShare]) {
            NSLog(@"Unable to add the image!");
       // }
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else {
        NSLog(@"Twitter not Installed");
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                              message:@"Cannot share - no Twitter app installed."
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
        
    }
    
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}


-(void)viewWillLayoutSubviews{

    [self setContentSizeScrollView];

}


#pragma mark - Private function
-(void)setContentSizeScrollView {
    
    int scrollViewHeight=0;
    self.txtDescription.frame=  [self contentSizeRectForTextView:self.txtDescription];
    //calculate scrollView contentSize
    
    for (UIView* view in self.myScrollView.subviews)
    {
        if (!view.hidden) {
            scrollViewHeight += view.frame.size.height;
        }
        
    }
    [self.myScrollView setContentSize:(CGSizeMake(320, scrollViewHeight+20))];
}

- (CGRect)contentSizeRectForTextView:(UITextView *)textView
{
    [textView.layoutManager ensureLayoutForTextContainer:textView.textContainer];
    CGRect textBounds = [textView.layoutManager usedRectForTextContainer:textView.textContainer];
    CGFloat height = (CGFloat)ceil(textBounds.size.height + textView.textContainerInset.top + textView.textContainerInset.bottom);
    return CGRectMake(textView.frame.origin.x, textView.frame.origin.y, 310, height);
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
@end
