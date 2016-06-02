//
//  Demo1ViewController.m
//  WRScrollTabPage
//
//  Created by wenrui on 16/6/1.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import "Demo1ViewController.h"
#import "Item1ViewController.h"
#import "Item2ViewController.h"


#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@interface Demo1ViewController ()

@property(nonatomic,retain)WRPageViewController *controller;

@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _controller=[[WRPageViewController alloc] init];
    _controller.menuTitles=@[@"排序",@"优选"];
    _controller.menu.backgroundColor = [UIColor whiteColor];
    _controller.delegate=self;
    [self addChildViewController:_controller];
    [self.view addSubview:_controller.view];

    NSLog(@"%@",self.navigationController.navigationBar.tintColor);
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
//    0 0.478431 1 1
}

-(void)Initializationed:(WRPageViewController *)controller{

    _controller.headerView.backgroundColor=[UIColor whiteColor];
    _controller.menu.backgroundColor=kUIColorFromRGB(0xf3f2f2);
    
    UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bac"]];
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

@end
