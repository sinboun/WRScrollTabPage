//
//  WRContentTableViewController.m
//  tybus
//
//  Created by wenrui on 16/5/12.
//  Copyright © 2016年 liujunjie. All rights reserved.
//

#import "WRContentTableViewController.h"

@interface WRContentTableViewController ()

@end

@implementation WRContentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView=self.tableView;
    
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    
    if ([self.zedelegate respondsToSelector:@selector(tableViewDidScrollPassY:)]) {
        [self.zedelegate tableViewDidScrollPassY:self.tableView.contentOffset.y];
    }
    
}

@end
