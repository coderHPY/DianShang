//
//  MyNaviViewController.m
//  DianShang
//
//  Created by He on 16/11/6.
//  Copyright © 2016年 He. All rights reserved.
//

#import "MyNaviViewController.h"

@interface MyNaviViewController ()<UIGestureRecognizerDelegate>

@end

@implementation MyNaviViewController

+ (void)initialize
{
    // 设置UINavigationBar
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    barAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [bar setTitleTextAttributes:barAttrs];
    
    // 设置UIBarButtonItem
    UIBarButtonItem *Item = [UIBarButtonItem appearance];
    
    NSMutableDictionary *normalItemAttrs = [NSMutableDictionary dictionary];
    normalItemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    normalItemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [Item setTitleTextAttributes:normalItemAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *disabledItemAttrs = [NSMutableDictionary dictionary];
    disabledItemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [Item setTitleTextAttributes:disabledItemAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置监听拖拽手势代理
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count >= 1) {
        
        // 创建button
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [backButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        // push进来时隐藏底部bar
        viewController.hidesBottomBarWhenPushed = YES;
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)backButtonClick
{
    [self popViewControllerAnimated:YES];
}

// 每当用户触发【返回手势】时都会调用一次这个方法
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

@end
