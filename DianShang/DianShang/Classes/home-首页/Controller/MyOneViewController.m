//
//  MyOneViewController.m
//  DianShang
//
//  Created by He on 16/11/7.
//  Copyright © 2016年 He. All rights reserved.
//

#import "MyOneViewController.h"

@interface MyOneViewController ()
@property(nonatomic, strong)UIView *vv;
@end

@implementation MyOneViewController

static NSString * const cellID = @"cell";
static NSString * const HeaderID = @"header";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
//    [self setUpNav];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
//    [self setUpTable];
    
//    [self setUpRefresh];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:HeaderID];

}

- (void)setUpTable
{
    self.tableView.backgroundColor = MyCommonBgColor;
    // 内容的内边距
    self.tableView.contentInset = UIEdgeInsetsMake(MyNavBarMaxY + MyTitlesViewH, 0, MyTabBarH, 0);
    // 去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 滚动条的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    UIView *vv = [[UIView alloc] init];
    vv.backgroundColor = [UIColor redColor];
    vv.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    
    UIView *header = [[UIView alloc] init];
    header.height = 300;
    [header addSubview:vv];
    
    self.tableView.tableHeaderView = header;
}

#pragma mark -<UITableViewDelegate>
// 将要拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark -<UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = @"1";

    return cell;
}


@end
