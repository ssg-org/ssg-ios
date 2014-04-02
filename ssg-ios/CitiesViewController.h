//
//  CitiesViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SsgCommunicatorDelegate.h"
#import "SsgCommunicator.h"

@interface CitiesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SsgCommunicatorDelegate>
{
   
    SsgCommunicator * _ssgCommunicator;
    
}


@end
