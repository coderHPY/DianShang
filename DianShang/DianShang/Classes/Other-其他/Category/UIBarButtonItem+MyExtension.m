//
//  UIBarButtonItem+MyExtension.m
//  DianShang
//
//  Created by He on 16/11/7.
//  Copyright © 2016年 He. All rights reserved.
//

#import "UIBarButtonItem+MyExtension.h"

@implementation UIBarButtonItem (MyExtension)

+ (instancetype)itemWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

@end
