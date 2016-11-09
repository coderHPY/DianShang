//
//  PrefixHeader.h
//  DianShang
//
//  Created by He on 16/11/7.
//  Copyright © 2016年 He. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h

#import "UIBarButtonItem+MyExtension.h"
#import "UIView+MyExtension.h"


#import "MyConst.h"

#define MyARGBColor(a, r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define MyColor(r, g, b) MyARGBColor(255, (r), (g), (b)) // 不透明的rgb颜色
#define MyGrayColor(v) MyColor((v), (v), (v))
#define MyCommonBgColor MyGrayColor(215)

#endif /* PrefixHeader_h */
