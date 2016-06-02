//
//  Demo2ViewController.m
//  WRScrollTabPage
//
//  Created by wenrui on 16/6/1.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import "Demo2ViewController.h"

#import "Item1ViewController.h"
#import "Item2ViewController.h"
#import "UINavigationBar+Awesome.h"

#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@interface Demo2ViewController ()

@property(nonatomic,retain)WRPageViewController *controller;

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.navigationItem.title=@"demo2";
    _controller=[[WRPageViewController alloc] init];
    _controller.menuTitles=@[@"排序",@"优选"];
    _controller.menu.backgroundColor = [UIColor whiteColor];
    _controller.delegate=self;
    [self addChildViewController:_controller];
    [self.view addSubview:_controller.view];
    
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //将status bar 文本颜色设置为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
}

-(void)Initializationed:(WRPageViewController *)controller{
    
    _controller.headerView.backgroundColor=[UIColor whiteColor];
    _controller.menu.backgroundColor=kUIColorFromRGB(0xf3f2f2);
    _controller.menu.bottomLine.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    [((UIButton*)_controller.menu.btns[0]) setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1] forState:UIControlStateNormal];
//    backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    
    UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    image.frame=_controller.headerView.frame;
    NSLog(@"%@",NSStringFromCGRect(_controller.headerView.frame));
    [_controller.headerView addSubview:image];
}

-(UIViewController *)tableViewControllerInIndex:(NSUInteger)index menuStr:(NSString *)menuStr{
    
    if (index==0) {
        Item1ViewController *item1=[[Item1ViewController alloc] init];
        item1.zedelegate=_controller;
        return item1;
    }else{
        Item2ViewController *item2=[[Item2ViewController alloc] init];
        item2.zedelegate=_controller;
        return item2;
        
    }
    
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    self.tableView.delegate = self;
//    [self scrollViewDidScroll:self.tableView];
    [self updateHeadViewFrame:_controller.headerView tableviewScrollY:0];
//    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
//      [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.tableView.delegate = nil;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar lt_reset];
}


-(void)updateHeadViewFrame:(UIView *)headerView tableviewScrollY:(CGFloat)tableviewScrollY{

    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = 0-headerView.frame.origin.y;
    
    
    
    if (offsetY > 50) {
        CGFloat alpha = MIN(1, 1 - ((50 + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}


@end
