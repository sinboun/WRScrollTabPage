//
//  WRPageViewController.m
//  tabbar
//
//  Created by wenrui on 16/5/10.
//  Copyright © 2016年 wenrui. All rights reserved.
//

#import "WRPageViewController.h"


@interface WRPageViewController ()

@property(nonatomic,retain)UIScrollView* contentScrollView;




@property(nonatomic,retain)NSMutableArray* tableViewControllers;

@property(nonatomic,retain)NSMutableArray* scrollViews;



@property(nonatomic,assign)CGFloat menuHeight;


@property(nonatomic,assign)CGFloat scrollX;
@property(nonatomic,assign)CGFloat scrollY;



@end

@implementation WRPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Initialization];
    
}
-(UIScrollView *)getContentView{

    return self.contentScrollView;
}

/**
 *  初始化
 */
-(void)Initialization{
    
    NSAssert(_menuTitles != nil, @"必须传入菜单头");
    NSAssert(_menuTitles.count>0, @"必须传入菜单头");
    NSAssert(_delegate != nil, @"必须传入代理");
    
    
    self.menuHeight=40;
    
    if ([UIScreen mainScreen].bounds.size.width == 414) {
        if (!self.headViewHeight) {
            self.headViewHeight=250;
        }

    }else{
    if (!self.headViewHeight) {
        self.headViewHeight=200;
    }
    }
    
    if (!self.navigatonBarHeight) {
        self.navigatonBarHeight=64;
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _contentScrollView=[[UIScrollView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:_contentScrollView];
    _contentScrollView.backgroundColor=[UIColor redColor];
    _contentScrollView.delegate=self;
    _contentScrollView.bounces=NO;
    _contentScrollView.pagingEnabled=YES;
    _contentScrollView.showsVerticalScrollIndicator=NO;
    _contentScrollView.showsHorizontalScrollIndicator=NO;
    _contentScrollView.contentSize=CGSizeMake(_menuTitles.count*self.view.frame.size.width, self.view.frame.size.height);
    
    _headerView=[[WRPageHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, _headViewHeight)];
    _headerView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_headerView];
    
    _menu=[[WRPageMenuView alloc] initWithFrame:CGRectMake(0, _headViewHeight, self.view.frame.size.width, _menuHeight)];
    _menu.delegate=self;
    [_menu setMenuTitles:self.menuTitles];
    _menu.backgroundColor=[UIColor blueColor];
    [self.view addSubview:_menu];
//    
//    [_menu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(_headerView);
//        make.top.mas_equalTo(_headerView.mas_bottom);
//        make.height.mas_equalTo(_menuHeight);
//    }];
    
    
    self.tableViewControllers=[[NSMutableArray alloc] init];
     self.scrollViews=[[NSMutableArray alloc] init];
    for (int i=0; i<_menuTitles.count; i++) {
        UIViewController* content=[self.delegate tableViewControllerInIndex:i menuStr:_menuTitles[i]];
        UIScrollView* scrollView;
        
        if ([content isKindOfClass:[WRContentViewController class]]) {
            scrollView=((WRContentViewController*)content).scrollView;
        }else if ([content isKindOfClass:[WRContentTableViewController class]]){
            scrollView=((WRContentTableViewController*)content).tableView;
        }
      
        [self.tableViewControllers addObject:content];
        scrollView.contentInset = UIEdgeInsetsMake(_headViewHeight+_menuHeight,scrollView.contentInset.left,scrollView.contentInset.bottom, scrollView.contentInset.right);
        [self addChildViewController:content];
        
        CGRect tableViewFrame=scrollView.frame;
        tableViewFrame.origin.x=i*self.view.frame.size.width;
        tableViewFrame.origin.y=0;
        
        scrollView.frame=tableViewFrame;
        tableViewFrame.origin.y=-(_headViewHeight+_menuHeight);
        scrollView.bounds=tableViewFrame;
        [_scrollViews addObject:scrollView];
        [_contentScrollView addSubview:scrollView];
        
    }
    _scrollX=0;
    _scrollY=0;
    
    if ([self.delegate respondsToSelector:@selector(Initializationed:)]) {
        [self.delegate Initializationed:self];
    }
}

-(void)changeSelect:(NSInteger)selectIndex{
   
    // 得到每页宽度
    CGFloat pageWidth = self.view.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((self.contentScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if (currentPage==selectIndex) {
        return;
    }
    
    [UIView animateWithDuration:0.4 animations:^{
        self.contentScrollView.contentOffset=CGPointMake(pageWidth*selectIndex, 0);
    }];
    
    if ([self.delegate respondsToSelector:@selector(changeSelect:)]) {
        [self.delegate changeSelect:selectIndex];
    }

    
}

-(void)tableViewDidScrollPassY:(CGFloat)tableviewScrollY{
    
    _scrollY = tableviewScrollY;
    
    CGFloat cha=(_headViewHeight+_menuHeight)+tableviewScrollY;
    
    if (cha<0) {
        CGRect tframe=self.headerView.frame;
        tframe.origin.y=0;
        
        self.headerView.frame=tframe;
        CGRect mframe=_menu.frame;
        mframe.origin.y=self.headerView.frame.origin.y+self.headerView.frame.size.height;
        _menu.frame=mframe;
        
        if ([self.delegate respondsToSelector:@selector(updateHeadViewFrame:tableviewScrollY:)]) {
            [self.delegate updateHeadViewFrame:self.headerView tableviewScrollY:_scrollY];
        }
        
        return;
    }
    if (cha<=(_headViewHeight-64)) {
        
        CGRect tframe=self.headerView.frame;
        tframe.origin.y=-cha;
        self.headerView.frame=tframe;
        
        
    }else if (cha>=(_headViewHeight-64)){
        
        CGRect tframe=self.headerView.frame;
        tframe.origin.y=-(_headViewHeight-64);
        self.headerView.frame=tframe;
       
    }
    
    
    CGRect mframe=_menu.frame;
    mframe.origin.y=self.headerView.frame.origin.y+self.headerView.frame.size.height;
    _menu.frame=mframe;
    if ([self.delegate respondsToSelector:@selector(updateHeadViewFrame:tableviewScrollY:)]) {
        [self.delegate updateHeadViewFrame:self.headerView tableviewScrollY:_scrollY];
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
    if (_scrollX==scrollView.contentOffset.x) {
        return;
    }
    // 当tableview滑动到很靠上的时候,下一个tableview出现时只用在menuView之下
    if (_scrollY >= -_menuHeight-_navigatonBarHeight) {
        _scrollY = -_menuHeight-_navigatonBarHeight;
    }

    if (self.headerView.frame.origin.y!=0) {
        for (UIViewController* item in _tableViewControllers) {
            
            
            UIScrollView* scrollView=NULL;
            
            if ([item isKindOfClass:[WRContentViewController class]]) {
                scrollView=((WRContentViewController*)item).scrollView;
            }else if ([item isKindOfClass:[WRContentTableViewController class]]){
                scrollView=((WRContentTableViewController*)item).tableView;
            }
            
            CGRect scrollBounds = scrollView.bounds;
            scrollBounds.origin = CGPointMake(0, _scrollY);
            scrollView.bounds = scrollBounds;
                        
            
        }
    }
    _scrollX = scrollView.contentOffset.x;
    
    // 得到每页宽度
    CGFloat pageWidth = self.view.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((self.contentScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    [self.menu contentChange:currentPage];
    
    if ([self.delegate respondsToSelector:@selector(changeSelect:)]) {
        [self.delegate changeSelect:currentPage];
    }

    
}


-(UIScrollView*)getCurrentScrollView{

    return  self.scrollViews[self.menu.selectIndex];
}



@end
