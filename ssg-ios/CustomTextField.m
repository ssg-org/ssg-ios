//
//  CustomTextField.m
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "CustomTextField.h"


@implementation CustomTextField

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
	}
	return self;
}

- (void)drawPlaceholderInRect:(CGRect)rect {
	if (!self.placeholderColor) {
		[self setPlaceholderColor:[UIColor lightGrayColor]];
	}


	if (!self.paragraphStyle) {
		self.paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
		// Set line break mode
		self.paragraphStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
		// Set text alignment
		self.paragraphStyle.alignment = NSTextAlignmentCenter;
	}


	// Set font
	CGRect placeholderRect = CGRectMake(rect.origin.x, (rect.size.height - self.font.pointSize) / 2, rect.size.width, self.font.pointSize);

	NSDictionary *attributes = @{ NSFontAttributeName: [UIFont fontWithName:@"FuturaStd-Light" size:14], NSParagraphStyleAttributeName: self.paragraphStyle
		                          , NSForegroundColorAttributeName :self.placeholderColor };
	[[self placeholder] drawInRect:placeholderRect withAttributes:attributes];
}

@end
