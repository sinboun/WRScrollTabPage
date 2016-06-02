//
//  WRPageMenuView.h
//  tabbar
//
//  Created by wenrui on 16/5/10.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^CodeBlock)(NSInteger index);



/**
 *  WRPageMenuViewDelegate 的滚动代理
 */
@protocol WRPageMenuViewDelegate <NSObject>

@required

/**
 *  滚动时候触发
 *
 *  @param selectIndex
 */
-(void)changeSelect:(NSInteger) selectIndex;






@end



@interface WRPageMenuView : UIView


@property(nonatomic,retain)UIView* bottomLine;

@property(nonatomic,copy)CodeBlock block;

@property(nonatomic,assign)NSInteger selectIndex;


@property(nonatomic,assign) id delegate;


@property(nonatomic,retain)NSMutableArray* btns;


-(void)setMenuTitles:(NSArray*) titles;

-(void)contentChange:(NSInteger) index;




@end
