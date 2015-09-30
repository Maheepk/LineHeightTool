//
//  UILabelWithFexibleHeight.m
//  Cinemarun
//
//  Created by MaheepK on 28/08/15.
//  Copyright (c) 2015 Ergun Development LLC. All rights reserved.
//

#import "UILabelWithFexibleHeight.h"
#import "NSString+Height.h"
#import "LineHeightConstant.h"

@implementation UILabelWithFexibleHeight

- (void)drawRect:(CGRect)rect
{
    [super drawRect:[self updatedFrame]];
}

- (CGRect) updatedFrame
{
    CGRect frame = [NSString setAttributeWithString:self.text withLineSpacing:kLineHeightSpace withSize:self.frame.size withFont:self.font withLabel:self setLabelTextColor:self.textColor];
    self.height.constant = frame.size.height;
    return frame;
}

@end
