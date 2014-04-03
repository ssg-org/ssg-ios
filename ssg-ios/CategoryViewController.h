//
//  CategoryViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SsgCommunicator.h"
#import "SsgCommunicatorDelegate.h"

@interface CategoryViewController : UIViewController<SsgCommunicatorDelegate>
{
    SsgCommunicator * _ssgCommunicator;
}
@end
