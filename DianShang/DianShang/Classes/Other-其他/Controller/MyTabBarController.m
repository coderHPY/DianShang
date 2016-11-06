//
//  MyTabBarController.m
//  DianShang
//
//  Created by He on 16/11/6.
//  Copyright © 2016年 He. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyHomeViewController.h"
#import "MyCatagoriesViewController.h"
#import "MyShoppingCarViewController.h"
#import "MyMineViewController.h"
#import "MyNaviViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTabBarItem];
    
    [self setUpAllChildViewController];
}

- (void)setUpTabBarItem
{
    // normal
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // selected
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)setUpAllChildViewController
{
    [self setUpChildViewController:[[MyHomeViewController alloc] init] Title:@"首页" ImageName:nil selectedImageName:nil];
    
    [self setUpChildViewController:[[MyCatagoriesViewController alloc] init] Title:@"分类" ImageName:nil selectedImageName:nil];
    
    [self setUpChildViewController:[[MyShoppingCarViewController alloc] init] Title:@"购物车" ImageName:nil selectedImageName:nil];
    
    [self setUpChildViewController:[[MyMineViewController alloc] init] Title:@"我的" ImageName:nil selectedImageName:nil];
}

- (void)setUpChildViewController:(UIViewController *)viewController Title:(NSString *)title ImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    MyNaviViewController *nav = [[MyNaviViewController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    nav.view.backgroundColor = [UIColor redColor];
}

@end
