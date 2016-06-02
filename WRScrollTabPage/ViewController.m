//
//  ViewController.m
//  WRScrollTabPage
//
//  Created by wenrui on 16/6/1.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import "ViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
@interface ViewController ()

@property(nonatomic,retain) NSArray* titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titles=@[@"原始",@"导航渐变+LTNavigationBar"];
//    self.navigationItem.title=@"WRScrollTabPage";
    self.tableView.tableFooterView=[UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"item"];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _titles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
    cell.textLabel.text=_titles[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            Demo1ViewController *demo1=[[Demo1ViewController alloc] init];
            [self.navigationController pushViewController:demo1 animated:YES];
        }
            break;
        case 1:
        {
            Demo2ViewController *demo2=[[Demo2ViewController alloc] init];
            [self.navigationController pushViewController:demo2 animated:YES];
        }
            break;
     
            
        default:
            break;
    }
}








@end
