//
//  UIView+Frame.m
//  LocalImageEdit
//
//  Created by XT on 14-6-17.
//  Copyright (c) 2014年 XT. All rights reserved.
//

#import "UIView+XTFrame.h"

@implementation UIView (XTFrame)



- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}


- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


@end