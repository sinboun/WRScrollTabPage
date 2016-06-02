//
//  WRContentViewController.h
//  tybus
//
//  Created by wenrui on 16/5/12.
//  Copyright © 2016年 liujunjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRPageViewController.h"

@class WRPageViewController;


@interface WRContentViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,assign)UIScrollView* scrollView;

@property(nonatomic,retain) WRPageViewController* zedelegate;

@end
