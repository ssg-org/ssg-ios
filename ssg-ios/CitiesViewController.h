//
//  CitiesViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SsgCommunicatorDelegate.h"
#import "SsgCommnicatorDelegate_Info.h"

@interface CitiesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SsgCommunicatorDelegate>
{
   
    SsgCommnicatorDelegate_Info * _ssgCommunicator;
    
}


@end
