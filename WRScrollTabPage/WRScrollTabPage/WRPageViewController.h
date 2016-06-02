//
//  WRPageViewController.h
//  tabbar
//
//  Created by wenrui on 16/5/10.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRPageHeaderView.h"
#import "WRPageMenuView.h"
#import "WRContentViewController.h"
#import "WRContentTableViewController.h"
/**
 *  UITableViewController 的滚动代理
 */
@protocol WRTableViewControllerDelegate <NSObject>

@required
/**
 *  滚动时候触发
 *
 *  @param tableviewScrollY 此时的Y
 */
-(void)tableViewDidScrollPassY:(CGFloat) tableviewScrollY;

@end


@class WRPageViewController;


/**
 *  WRPageViewController 的滚动代理
 */
@protocol WRPageViewControllerDelegate <NSObject>

@required
/**
 *  根据菜单返回控制器
 *
 *  @param index 菜单索引
 *  @param menu  menu
 */
-(UIViewController*)tableViewControllerInIndex:(NSUInteger) index menuStr:(NSString*)menuStr;

/**
 *  初始化完成
 */
@optional
-(void)Initializationed:(WRPageViewController*) controller;

//-(void)pageScrollViewDidScroll:(UIScrollView *) pageScrollView;

-(void)updateHeadViewFrame:(UIView *) headerView tableviewScrollY:(CGFloat)tableviewScrollY;

/**
 *  切换选项
 *
 *  @param selectIndex
 */
-(void)changeSelect:(NSInteger) selectIndex;



@end





@interface WRPageViewController : UIViewController<UIScrollViewDelegate,WRTableViewControllerDelegate,UIScrollViewDelegate,WRPageMenuViewDelegate>

/**
 *  头视图的高度
 */
@property(nonatomic,assign)CGFloat headViewHeight;

/**
 *  导航栏的高度
 */
@property(nonatomic,assign)CGFloat navigatonBarHeight;

/**
 *  头视图
 */
@property(nonatomic,retain)WRPageHeaderView* headerView;


/**
 *  导航条
 */
@property(nonatomic,retain)WRPageMenuView* menu;


/**
 *  菜单头
 */
@property(nonatomic,retain)NSArray* menuTitles;


/**
 *  代理
 */
@property(nonatomic,assign)id delegate;

-(UIScrollView*)getContentView;

-(UIScrollView*)getCurrentScrollView;

@end
