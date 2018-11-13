# HQMVVM_RAC_Router

### 搭建App框架（MVVM+RAC+路由）

### 效果
![images](https://github.com/HanQiGod/HQMVVM_RAC_Router/blob/master/HQMVVM_RAC_Router/%E8%B7%AF%E7%94%B1.gif)

### 项目的介绍

项目使用了ReactiveCocoa框架，实现了MVVM架构，使用MVVM架构主要目的是分离视图(View)和模型(Model)。

### MVVM四大优点:

 1. 低耦合。视图（View）可以独立于Model变化和修改，一个ViewModel可以绑定到不同的"View"上，当View变化的时候Model可以不变，当Model变化的时候View也可以不变。
 2. 可重用性。你可以把一些视图逻辑放在一个ViewModel里面，让很多view重用这段视图逻辑。
 3. 独立开发。开发人员可以专注于业务逻辑和数据的开发（ViewModel），设计人员可以专注于页面设计，使用Expression
    Blend可以很容易设计界面并生成xaml代码。
 4. 可测试。界面素来是比较难于测试的，而现在测试可以针对ViewModel来写

### 项目的搭建

#### 1.搭建项目主框架
![在这里插入图片描述](https://img-blog.csdnimg.cn/2018111311214922.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA5NjAyNjU=,size_16,color_FFFFFF,t_70)


#### 2.CocoaPods集成的第三方框架

 - AFNetworking 网络请求
 - DateTools 日期的相对处理
 - JLRoutes 路由跳转
 - JPFPSStatus 显示屏幕的帧数
 - MBProgressHUD 蒙版
 - MJExtension 字典转模型框架
 - MJRefresh 界面刷新
 - MYLayout 浮动布局
 - ReactiveCocoa 函数响应式编程
 - SDAutoLayout 简单的布局
 - SDCycleScrollVIew 无限循环轮播图
 - SDWebImage 加载图片

#### 3.初步搭建界面

##### 1.初始化项目

```
- (void)registerRoutes{

    HQTabBarController *rootVC = [HQTabBarController  tabBarControllerWithAddChildVCsBlock:^(WZXTabBarController *tabBarC) {
        
        [tabBarC addChildVC:[HQHomeViewController new] title:@"主页" normalImageName:@"tabar_zhuye2.png" selectedImageName:@"tabar_zhuye.png" isRequiredNavController:YES];
        [tabBarC addChildVC:[HQCircleFriendsViewController new] title:@"主页2" normalImageName:@"tabar_tuijian2.png" selectedImageName:@"tabar_tuijiani.png" isRequiredNavController:YES];
        [tabBarC addChildVC:[HQHomeViewController new] title:@"中间按钮" normalImageName:@"tabar_suishoupai2.png" selectedImageName:@"tabar_suishoupai.png" isRequiredNavController:YES];
        [tabBarC addChildVC:[HQFindViewController new] title:@"朋友" normalImageName:@"tabar_linxin2.png" selectedImageName:@"tabar_linxin.png" isRequiredNavController:YES];
        [tabBarC addChildVC:[HQAccountViewController new] title:@"我的" normalImageName:@"tabar_geren2.png" selectedImageName:@"tabar_geren.png" isRequiredNavController:YES];
        
    }];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
//    navigation Push规则
    [[JLRoutes globalRoutes] addRoute:@"/NaviPush/:controller" handler:^BOOL(NSDictionary<NSString *,NSString *> * _Nonnull parameters) {
        
        NSLog(@"parameters==%@",parameters);
        UIViewController *v = [[NSClassFromString(parameters[@"controller"]) alloc] init];
        [self paramToVc:v param:parameters];
        [[self currentViewController] pushViewController:v animated:YES];
        return YES;
    }];
}
```

##### 2.路由跳转

```
-(void)paramToVc:(UIViewController *) v param:(NSDictionary<NSString *,NSString *> *)parameters{
    //        runtime将参数传递至需要跳转的控制器
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(v.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [v setValue:param forKey:key];
        }
    }
}

/**
 *          获取当前控制器
 */
-(UINavigationController *)currentViewController{
    
    HQTabBarController *HQTabBar = (HQTabBarController *)self.window.rootViewController;
    return HQTabBar.selectedViewController;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"从哪个app跳转而来 Bundle ID: %@", options[UIApplicationOpenURLOptionsSourceApplicationKey]);
    NSLog(@"URL scheme:%@", [url scheme]);
    
#pragma mark - JLRoutes（默认的Scheme）
    
    return [[JLRoutes globalRoutes] routeURL:url];
}
- (void)urlClick{
    
    // 发送请求
    RACSignal *signal = [[[HQHomeViewModel alloc]init].requestCommand execute:@{@"code":@"Home"}];
    [signal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        NSString *customURL = @"HQMVVMRACRouter://NaviPush/TwoViewController?name=home&userId=10000&age=18&adbc=29";
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:nil];        
    }];
}
```

希望各位大神指出不足的地方，大家共同进步！谢谢。
