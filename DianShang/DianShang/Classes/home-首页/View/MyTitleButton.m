//
//  MyTitleButton.m
//  DianShang
//
//  Created by He on 16/11/7.
//  Copyright © 2016年 He. All rights reserved.
//

#import "MyTitleButton.h"

@implementation MyTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

@end
