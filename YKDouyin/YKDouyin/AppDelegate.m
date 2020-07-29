//
//  AppDelegate.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "AppDelegate.h"
#import "LNBaseTabbarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    
    LNBaseTabbarViewController *baseTabbarVC = [[LNBaseTabbarViewController alloc] init];
    self.window.rootViewController = baseTabbarVC;
    [self.window makeKeyAndVisible];
    return YES;
}




@end
