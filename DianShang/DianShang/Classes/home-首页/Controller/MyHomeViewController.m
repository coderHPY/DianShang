//
//  MyHomeViewController.m
//  DianShang
//
//  Created by He on 16/11/6.
//  Copyright © 2016年 He. All rights reserved.
//

#import "MyHomeViewController.h"
#import "MyOneViewController.h"
#import "MyTwoViewController.h"
#import "MyThreeViewController.h"
#import "MyFourViewController.h"
#import "MyFiveViewController.h"
#import "MyTitleButton.h"
#import "MySearchViewController.h"

@interface MyHomeViewController ()

@end

@interface MyHomeViewController()<UIScrollViewDelegate>

// 存放所有子控制器的view
@property(nonatomic, weak)UIScrollView *scrollView;
// 标题栏view
@property(nonatomic, weak)UIView *titlesView;
// 当前被选中的按钮
@property(nonatomic, weak)MyTitleButton *selecetedTitleButton;
// 标题栏底部的指示器
@property(nonatomic, weak)UIView *titleBottomView;
// 存放所有的标题栏按钮
@property(nonatomic, strong)NSMutableArray *titleButtons;

@end

@implementation MyHomeViewController

- (NSMutableArray *)titleButtons
{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];

    [self setUpChlidViewControllers];
    
    [self setUpScrollView];
    
    [self setUpTitlesView];
}

- (void)setUpNav
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"" highlightedImage:@"" target:self action:@selector(searchClick)];
}

- (void)setUpChlidViewControllers
{
    MyOneViewController *one = [[MyOneViewController alloc] init];
    one.title = @"第一个";
    [self addChildViewController:one];
    
    MyTwoViewController *two = [[MyTwoViewController alloc] init];
    two.title = @"第二个";
    [self addChildViewController:two];
    
    MyThreeViewController *three = [[MyThreeViewController alloc] init];
    three.title = @"第三个";
    [self addChildViewController:three];
    
    MyFourViewController *four = [[MyFourViewController alloc] init];
    four.title = @"第四个";
    [self addChildViewController:four];
    
    MyFiveViewController *five = [[MyFiveViewController alloc] init];
    five.title = @"第五个";
    [self addChildViewController:five];
}

- (void)setUpScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = MyCommonBgColor;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
}


- (void)setUpTitlesView
{
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    titlesView.frame = CGRectMake(0, MyNavBarMaxY, self.view.width, 35);
    
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    NSUInteger count = self.childViewControllers.count;
    CGFloat titleButtonW = titlesView.width / count;
    CGFloat titleButtonH = titlesView.height;
    for (int i = 0; i < count; i++) {
        
        MyTitleButton *titleButton = [MyTitleButton buttonWithType:UIButtonTypeCustom];
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
        
        NSString *title = [self.childViewControllers[i] title];
        [titleButton setTitle:title forState:UIControlStateNormal];
        titleButton.width = titleButtonW;
        titleButton.height = titleButtonH;
        titleButton.x = i * titleButton.width;
        titleButton.y = 0;
    }
    
    UIView *titleBottomView = [[UIView alloc] init];
    titleBottomView.backgroundColor = [self.titleButtons.lastObject titleColorForState:UIControlStateSelected];
    
//    titleBottomView.backgroundColor = [self.titleButtons.];
    titleBottomView.height = 1;
    titleBottomView.width = 50;
    titleBottomView.y = titlesView.height - titleBottomView.height;
    
    [titlesView addSubview:titleBottomView];
    self.titleBottomView = titleBottomView;
    
    MyTitleButton *firstTitleButton = self.titleButtons.firstObject;
    
    [firstTitleButton.titleLabel sizeToFit];
    
    titleBottomView.width = firstTitleButton.titleLabel.width;
    titleBottomView.centerX = firstTitleButton.centerX;
    
    [self titleButtonClick:firstTitleButton];
}

#pragma mark -按钮点击
- (void)titleButtonClick:(MyTitleButton *)titleButton
{
    self.selecetedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selecetedTitleButton = titleButton;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.titleBottomView.width = titleButton.titleLabel.width;
        self.titleBottomView.centerX = titleButton.centerX;
    }];
    
    CGPoint offset = self.scrollView.contentOffset;
    
    offset.x = self.view.width * [self.titleButtons indexOfObject:titleButton];
    
    [self.scrollView setContentOffset:offset animated:YES];
}

- (void)searchClick
{
    MySearchViewController *search = [[MySearchViewController alloc] init];
    
    [self.navigationController pushViewController:search animated:YES];
}

#pragma mark -<UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.width;
    
    UIViewController *willShowViewController = self.childViewControllers[index];
    
    if (willShowViewController.isViewLoaded) return;
    
    willShowViewController.view.frame = scrollView.bounds;
    
    [scrollView addSubview:willShowViewController.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    int index = scrollView.contentOffset.x / scrollView.width;
    [self titleButtonClick:self.titleButtons[index]];
}


@end
