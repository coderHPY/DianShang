//
//  UIBarButtonItem+MyExtension.h
//  DianShang
//
//  Created by He on 16/11/7.
//  Copyright © 2016年 He. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MyExtension)

+ (instancetype)itemWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action;

@end
