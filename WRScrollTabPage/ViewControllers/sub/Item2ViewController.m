//
//  Item2ViewController.m
//  WRScrollTabPage
//
//  Created by wenrui on 16/6/1.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import "Item2ViewController.h"

@interface Item2ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UITableView *tableView;


@end

@implementation Item2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableView=[[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.scrollView=_tableView;
        
        [self.view addSubview:_tableView];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"item"];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
   
        
        
    }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
    cell.textLabel.text=@"我不是TableViewController";
    return cell;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [super scrollViewDidScroll:scrollView];
}




@end
