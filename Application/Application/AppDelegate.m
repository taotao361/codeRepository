//
//  AppDelegate.m
//  Application
//
//  Created by yangxutao on 17/5/3.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



#pragma mark - 应用程序的生命周期
/// 程序启动只调用一次
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    
    /**
     调起应用程序的方式有好多种；
     1、用户自己打开应用   launchOptions 无数据
     2、点击推送打开，可用 UIApplicationLaunchOptionsRemoteNotificationKey 获取推送数据
     3、第三方URL调起应用 可用 UIApplicationStatusBarFrameUserInfoKey 后去数据 
     同时下面方法会被调用；
     /// iOS 9之前 当从别的应用程序启动本应用程序时调用该方法；例如在Safari 通过 urlscheme打开应用，微信qq微博分享完后返回应用程序时调用此方法，
     - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
     return NO;
     }
     
     /// iOS 9之前 当从别的应用程序启动本应用程序时调用该方法；
     - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
     return NO;
     }
     ///iOS 9 当从别的应用程序启动本应用程序时调用该方法；
     - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
     return NO;
     }

     
     一个完整的应用程序启动的过程：
     1、从main函数开始
     2、创建UIApplication对象，UIApplication的代理对象，建立应用程序的 主事件循环（main runloop）进行事件处理，
     3、代理delegate开始监听系统事件；
     4、应用程序启动完就会调用代理方法 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
     5、在 代理方法- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 内部创建 UIWindow，并设置UIWindow的根控制器，并把创建的 window设置为keyWindow并显示；
     6、一个UIApplication对象示例就代表一个应用程序，而且是单例，只有一个应用程序对象实例；在应用程序内部再次创建 UIApplication实例就会报错；
        There can only be one UIApplication instance.
     
     
     启动原理：
     main函数中执行了一个UIApplicationMain这个函数
     
     intUIApplicationMain(int argc, char *argv[], NSString *principalClassName, NSString *delegateClassName);
     
     argc、argv：直接传递给UIApplicationMain进行相关处理即可
     
     principalClassName：指定应用程序类名（app的象征），该类必须是UIApplication(或子类)。如果为nil,则用UIApplication类作为默认值
     
     delegateClassName：指定应用程序的代理类，该类必须遵守UIApplicationDelegate协议
     
     UIApplicationMain函数会根据principalClassName创建UIApplication对象，根据delegateClassName创建一个delegate对象，并将该delegate对象赋值给UIApplication对象中的delegate属性
     
     接着会建立应用程序的Main Runloop（事件循环），进行事件的处理(首先会在程序完毕后调用delegate对象的application:didFinishLaunchingWithOptions:方法)
     
     程序正常退出时UIApplicationMain函数才返回
     
    */
    
    return YES;
}

///应用程序将要失去焦点
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

///应用程序已经进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


///应用程序将要进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

///应用程序已经获取焦点 （处于活跃状态）
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

///应用程序将要被杀掉进程
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



#pragma mark -应用程序 代理回调 处理各种事件
///当系统时间改变时调用
- (void)applicationSignificantTimeChange:(UIApplication *)application {
    
}

///应用程序收到内存警告时调用，在此方法中可以停止下载，清除缓存等
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
}


#pragma -mark openUrl
/// iOS 9之前 当从别的应用程序启动本应用程序时调用该方法；例如在Safari 通过 urlscheme打开应用，微信qq微博分享完后返回应用程序时调用此方法，
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return NO;
}

/// iOS 9之前 当从别的应用程序启动本应用程序时调用该方法；
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return NO;
}
///iOS 9 当从别的应用程序启动本应用程序时调用该方法；
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return NO;
}



#pragma mark -通知
///当收到本地通知时调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification { }
///iOS10.0 之后废弃 当收到远程推送时调用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {}
///iOS7 当收到远程推送时调用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {}

///iOS 8特殊适配 已经注册远程通知
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}
///注册远程推送失败回调
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {}
///APNs服务器 回调给应用程序的唯一标识
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {}


///ios8出现的交互通知 可以自定义注册通知的类别category 和 动作action
/// ios8 -ios9 当通知的按钮被点击了，需要用注册时的identify来判断是哪类通知 下面方法iOS10已经废弃，使用 Use UserNotifications Framework's -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:]代替
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {}
/// ios9-ios10
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())completionHandler {}

/// ios8 -ios9
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler {}
/// ios9-ios10
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())completionHandler {}


#pragma mark - 状态栏
///应用 程序的状态栏方向已经改变时回调
- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation {}
///应用程序的状态栏的方向将要改变的时候回调
- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration {}

///应用程序的状态栏frame改变时调用；
- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame {}
///状态栏的frame将要改变时回调
- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame {}



#pragma mark -- User Activity Continuation protocol adopted by UIApplication delegate --
///ios8的新功能，目的是在两个OS设备上操作一件同样的事情，它用于保存和复原一个应用的当前状态 也叫 handoff
- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType NS_AVAILABLE_IOS(8_0) {
    return nil;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler NS_AVAILABLE_IOS(8_0) {
    return nil;
}

- (void)application:(UIApplication *)application didFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error NS_AVAILABLE_IOS(8_0) {}

- (void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity {}


#pragma mark - 当应用程序的屏幕方向改变时调用；
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskPortrait;
}


- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler {}




/** 
 
 一些常用的通知 key，一个key代表一个时间发生，当事件发生时，就会发出通知
 applicationDelegate 给出了代理方法 也给出了可监听的通知
 
 已经进入后台的通知
 UIKIT_EXTERN NSNotificationName const UIApplicationDidEnterBackgroundNotification       NS_AVAILABLE_IOS(4_0);
 将要进入前台
 UIKIT_EXTERN NSNotificationName const UIApplicationWillEnterForegroundNotification      NS_AVAILABLE_IOS(4_0);
 程序已经启动完成
 UIKIT_EXTERN NSNotificationName const UIApplicationDidFinishLaunchingNotification;
 程序进入前台
 UIKIT_EXTERN NSNotificationName const UIApplicationDidBecomeActiveNotification;
 程序将要退出前台
 UIKIT_EXTERN NSNotificationName const UIApplicationWillResignActiveNotification;
 接到内存警告
 UIKIT_EXTERN NSNotificationName const UIApplicationDidReceiveMemoryWarningNotification;
 程序进程将要本杀掉
 UIKIT_EXTERN NSNotificationName const UIApplicationWillTerminateNotification;
 系统时间改变会发出这个通知
 UIKIT_EXTERN NSNotificationName const UIApplicationSignificantTimeChangeNotification;
 状态栏方向将要改变的通知
 UIKIT_EXTERN NSNotificationName const UIApplicationWillChangeStatusBarOrientationNotification __TVOS_PROHIBITED; // userInfo contains NSNumber with new orientation
 
 状态栏方向已经发生改变的通知
 UIKIT_EXTERN NSNotificationName const UIApplicationDidChangeStatusBarOrientationNotification __TVOS_PROHIBITED;  // userInfo contains NSNumber with old orientation
 
 状态栏方向改变时的 字典 内容 key，根据这个key，可以获取新值旧值
 UIKIT_EXTERN NSString *const UIApplicationStatusBarOrientationUserInfoKey __TVOS_PROHIBITED;            // userInfo dictionary key for status bar orientation
 
 状态栏的frame将要改变的通知
 UIKIT_EXTERN NSNotificationName const UIApplicationWillChangeStatusBarFrameNotification __TVOS_PROHIBITED;       // userInfo contains NSValue with new frame
 状态栏的frame已经改变的通知
 UIKIT_EXTERN NSNotificationName const UIApplicationDidChangeStatusBarFrameNotification __TVOS_PROHIBITED;        // userInfo contains NSValue with old frame
 
 状态栏改变时 获取值得key
 UIKIT_EXTERN NSString *const UIApplicationStatusBarFrameUserInfoKey __TVOS_PROHIBITED;                  // userInfo dictionary key for status bar frame
 
 应用程序后台刷新状态改变时的通知
 UIKIT_EXTERN NSNotificationName const UIApplicationBackgroundRefreshStatusDidChangeNotification NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
 
 
 UIKIT_EXTERN NSNotificationName const UIApplicationProtectedDataWillBecomeUnavailable    NS_AVAILABLE_IOS(4_0);
 
 UIKIT_EXTERN NSNotificationName const UIApplicationProtectedDataDidBecomeAvailable       NS_AVAILABLE_IOS(4_0);

 当别的应用通过URL进入到应用时，获取URL的key
 <#若由其他应用程序通过openURL:启动，则UIApplicationLaunchOptionsURLKey对应的对象为启动 URL（NSURL）#>
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsURLKey                   NS_AVAILABLE_IOS(3_0); // userInfo contains NSURL with launch URL
 
 <#对应启动的源应用程序的 bundle ID (NSString)；#>
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsSourceApplicationKey     NS_AVAILABLE_IOS(3_0); // userInfo contains NSString with launch app bundle ID
 
 远程推送 获取推送数据的 key
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsRemoteNotificationKey    NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED; // userInfo contains NSDictionary with payload
 
 本地通知获取数据的key
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsLocalNotificationKey     NS_DEPRECATED_IOS(4_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:]") __TVOS_PROHIBITED; // userInfo contains a UILocalNotification
 
 
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsAnnotationKey            NS_AVAILABLE_IOS(3_2); // userInfo contains object with annotation property list
 
 定位相关
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsLocationKey              NS_AVAILABLE_IOS(4_0); // app was launched in response to a CoreLocation event.
 
 
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsNewsstandDownloadsKey    NS_AVAILABLE_IOS(5_0) __TVOS_PROHIBITED; // userInfo contains an NSArray of NKAssetDownload identifiers
 
 蓝牙相关
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsBluetoothCentralsKey     NS_AVAILABLE_IOS(7_0); // userInfo contains an NSArray of CBCentralManager restore identifiers
 
 
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsBluetoothPeripheralsKey  NS_AVAILABLE_IOS(7_0); // userInfo contains an NSArray of CBPeripheralManager restore identifiers
 
 3D touch 点击shortcutItem 相关
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsShortcutItemKey          NS_AVAILABLE_IOS(9_0) __TVOS_PROHIBITED; // userInfo contains the UIApplicationShortcutItem used to launch the app.
 // Key in options dict passed to application:[will | did]FinishLaunchingWithOptions and info for UIApplicationDidFinishLaunchingNotification
 
 
 handoff相关
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsUserActivityDictionaryKey NS_AVAILABLE_IOS(8_0); // Sub-Dictionary present in launch options when user activity is present
 
 
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsUserActivityTypeKey NS_AVAILABLE_IOS(8_0); // Key in user activity dictionary for the activity type
 
 
 UIKIT_EXTERN UIApplicationLaunchOptionsKey const UIApplicationLaunchOptionsCloudKitShareMetadataKey NS_AVAILABLE_IOS(10_0) __TVOS_PROHIBITED; // The presence of this key indicates that the app was launched in order to handle a CloudKit sharing invitation. The value of this key is a CKShareMetadata object.
 
 */












@end
