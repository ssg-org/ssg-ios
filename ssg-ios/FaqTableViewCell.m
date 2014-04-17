//
//  FaqTableViewCell.m
//  ssg-ios
//
//  Created by Haris Dautovic on 17/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "FaqTableViewCell.h"

@implementation FaqTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
