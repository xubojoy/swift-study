//
//  XTBlurView.h
//  NewXTNews
//
//  Created by XT on 14-8-10.
//  Copyright (c) 2014年 XT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Swift-golf-Bridging-Header.h"
@interface XTBlurView : UIView
@property (nonatomic, readwrite) CGFloat blurRadius;
@property (nonatomic, readwrite) CGFloat saturationDelta;
@property (nonatomic, readwrite) UIColor *tintColor;
@property (nonatomic, weak) UIView *viewToBlur;
@property (nonatomic) BOOL blur;
@end
