//
//  Item1ViewController.m
//  WRScrollTabPage
//
//  Created by wenrui on 16/6/1.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import "Item1ViewController.h"

@interface Item1ViewController ()

@end

@implementation Item1ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title=@"WRScrollTabPage";
    self.tableView.tableFooterView=[UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"item"];
    
    CGRect frame =   self.tableView.frame ;
    frame.size.height = frame.size.height+20;
    self.tableView.frame = frame;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
    cell.textLabel.text=@"我是TableViewController";
    return cell;
    
}

@end
