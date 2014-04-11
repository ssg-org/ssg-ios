//
//  AppDelegate.m
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import <GoogleMaps/GoogleMaps.h>
#import "FAImageView.h"
#import <KSCrash/KSCrashInstallationEmail.h>





@implementation AppDelegate
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    
     //Google maps API Key
    [GMSServices provideAPIKey:@"AIzaSyD7lqvVBatbAQbX0oTStokyRn2JHBBDAYQ"];
    [FBLoginView class];
    [FBProfilePictureView class];
    [GMSMapView class];
    [FAImageView class];

    [[UINavigationBar appearance] setBackgroundImage: [UIImage imageNamed:@"nav_bar.png"]  forBarMetrics:UIBarMetricsDefault];
    
    
//    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"arrow_left.png"]];
//    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"arrow_left.png"]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor] ];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
     self.navigationController =(UINavigationController *) self.window.rootViewController;
    
    
    //Init core data
    [self managedObjectContext];
    
   
    //Set navigation button font
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          
                                                          [UIFont fontWithName:@"FuturaStd-Book" size:14.0f],NSFontAttributeName,
                                                          
                                                          nil] forState:UIControlStateNormal];
    
    
    
    
    
     //Set navigation title font
     [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:@"FuturaStd-Medium" size:16.0f]}];
    
    
    [self installCrashHandler];
    
    return YES;
}

- (void) installCrashHandler
{
    // Create an installation (choose one)
    //    KSCrashInstallation* installation = [self makeStandardInstallation];
    KSCrashInstallation* installation = [self makeEmailInstallation];
    //    KSCrashInstallation* installation = [self makeHockeyInstallation];
    //    KSCrashInstallation* installation = [self makeQuincyInstallation];
    //    KSCrashInstallation *installation = [self makeVictoryInstallation];
    
    
    // Install the crash handler. This should be done as early as possible.
    // This will record any crashes that occur, but it doesn't automatically send them.
    [installation install];
  //  [KSCrash sharedInstance].deleteBehaviorAfterSendAll = KSCDeleteNever; // TODO: Remove this
    
    
    // Send all outstanding reports. You can do this any time; it doesn't need
    // to happen right as the app launches. Advanced-Example shows how to defer
    // displaying the main view controller until crash reporting completes.
    [installation sendAllReportsWithCompletion:^(NSArray* reports, BOOL completed, NSError* error)
     {
         if(completed)
         {
             NSLog(@"Sent %d reports", (int)[reports count]);
         }
         else
         {
             NSLog(@"Failed to send reports: %@", error);
         }
     }];
}

- (KSCrashInstallation*) makeEmailInstallation
{
    NSString* emailAddress = @"haris.dautovic@klika.ba";
    
    KSCrashInstallationEmail* email = [KSCrashInstallationEmail sharedInstance];
    email.recipients = @[emailAddress];
    email.subject = @"Crash Report";
    email.message = @"This is a crash report";
    email.filenameFmt = @"crash-report-%d.txt.gz";
    
    [email addConditionalAlertWithTitle:@"Crash Detected"
                                message:@"The app crashed last time it was launched. Send a crash report?"
                              yesAnswer:@"Sure!"
                               noAnswer:@"No thanks"];
    
    // Uncomment to send Apple style reports instead of JSON.
    [email setReportStyle:KSCrashEmailReportStyleApple useDefaultFilenameFormat:YES];
    
    return email;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
   
    return wasHandled;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    
    
    
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    NSLog(@"application background");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Core Data stack
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataModel" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
        return __persistentStoreCoordinator;
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataModel.sqlite"];
    //  if (![[NSFileManager defaultManager] fileExistsAtPath:[storeURL path]])
    //  {
    //      NSURL *preloadURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CoreData" ofType:@"sqlite"]];
    //      NSError* err = nil;
    //      if (![[NSFileManager defaultManager] copyItemAtURL:preloadURL toURL:storeURL error:&err])
    //      {
    //          NSLog(@"Oops, could copy preloaded data");
    //      }
    //  }
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil
                                                             URL:storeURL options:nil error:&error])
    {
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        [__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil
                                                            URL:storeURL options:nil error:&error];
    }
    return __persistentStoreCoordinator;
}

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}




@end
