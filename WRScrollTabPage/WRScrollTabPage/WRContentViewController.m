//
//  WRContentViewController.m
//  tybus
//
//  Created by wenrui on 16/5/12.
//  Copyright © 2016年 liujunjie. All rights reserved.
//

#import "WRContentViewController.h"

@interface WRContentViewController ()

@end

@implementation WRContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([self.zedelegate respondsToSelector:@selector(tableViewDidScrollPassY:)]) {
        NSLog(@"scrollView.contentOffset.y:%f",scrollView.contentOffset.y);
        [self.zedelegate tableViewDidScrollPassY:scrollView.contentOffset.y];
    }
    
}

@end
