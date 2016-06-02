//
//  WRPageMenuView.m
//  tabbar
//
//  Created by wenrui on 16/5/10.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import "WRPageMenuView.h"



@interface WRPageMenuView ()

@property(nonatomic,retain)NSArray* titles;

@property(nonatomic,assign)CGFloat itemWidth;


@property(nonatomic,retain)UIColor* bottomLineColor;




@end


@implementation WRPageMenuView




-(void)contentChange:(NSInteger)index{

    [self moveInIndex:index];
}



-(void)setMenuTitles:(NSArray *)titles{
    
    _selectIndex=0;
    
    _itemWidth= self.frame.size.width/titles.count;
    self.titles=titles;
    
    _btns=[NSMutableArray new];
    
    _bottomLine=[[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2, _itemWidth,2)];
    _bottomLine.backgroundColor=[UIColor redColor];
    [self addSubview:_bottomLine];
    
    for (int i=0; i<titles.count; i++) {
        NSString* title=titles[i];
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
         [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (i==0) {
             [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        btn.frame=CGRectMake(_itemWidth*i, 0, _itemWidth, self.frame.size.height);
        btn.tag=i;
        [btn addTarget:self action:@selector(btnItemAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:title forState:UIControlStateNormal];
        [self.btns addObject:btn];
        [btn setTitle:title forState:UIControlStateNormal];
        [self addSubview:btn];
        
    }
    
}

-(void)btnItemAction:(id)sender{

    UIButton* btn=(UIButton*)sender;
    if (self.block) {
        self.block(btn.tag);
    }
    [self moveInIndex:btn.tag];
}


-(void)moveInIndex:(NSInteger)index{
    
    for (UIButton* btn in self.btns) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    UIButton* btn=(UIButton*)self.btns[index];
    [btn setTitleColor:self.bottomLine.backgroundColor forState:UIControlStateNormal];
    [UIView animateWithDuration:0.4 animations:^{
        CGRect bottomLineFrame=self.bottomLine.frame;
        bottomLineFrame.origin.x=_itemWidth*index;
        self.bottomLine.frame=bottomLineFrame;

    }];
    
    if ([self.delegate respondsToSelector:@selector(changeSelect:)]) {
        [self.delegate changeSelect:index];
    }
     _selectIndex=index;
    
    
}

@end
