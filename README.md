
#1、拖入框架文件
```swift
在你的项目中拖入WRScrollTabPage文件夹

```

#2.导入头文件并实现代理

```swift
#import "WRPageViewController.h"
@interface Demo1ViewController : UIViewController<WRPageViewControllerDelegate>
```
#3、初始化
```swift
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //去掉自带的ScrollViewInsets
    self.automaticallyAdjustsScrollViewInsets=NO;
    //初始化框架
    _controller=[[WRPageViewController alloc] init];
    //设置菜单项
    _controller.menuTitles=@[@"排序",@"优选"];
    //设置菜单背景颜色
    _controller.menu.backgroundColor = [UIColor whiteColor];
    //设置代理
    _controller.delegate=self;
    //添加到当前视图
    [self addChildViewController:_controller];
    [self.view addSubview:_controller.view];
   
}
```
#4、在代理中返回内容视图
```swift
-(UIViewController *)tableViewControllerInIndex:(NSUInteger)index menuStr:(NSString *)menuStr{

    if (index==0) {
        Item1ViewController *item1=[[Item1ViewController alloc] init];
        item1.zedelegate=_controller;
        return item1;
    }else{
        Item2ViewController *item2=[[Item2ViewController alloc] init];
        item2.zedelegate=_controller;
        return item2;
        
    }
    
}
```
#5、内容视图需继承
```swift
#import "WRContentTableViewController.h"
@interface Item1ViewController : WRContentTableViewController
```
##or
```swift
#import "WRContentViewController.h"


@interface Item2ViewController : WRContentViewController



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


```

如果有问题欢迎交流沟通：**1505482941@qq.com**

#简书
<http://www.jianshu.com/users/592851689c5f/latest_articles>


#### Thank you for checking my project.
