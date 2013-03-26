//
//  HDAppDelegate.m
//  Hatch Demo
//
//  Created by Justin R. Miller on 3/26/13.
//  Copyright (c) 2013 MapBox. All rights reserved.
//

#import "HDAppDelegate.h"

#import "HDViewController.h"

@implementation HDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.rootViewController = [HDViewController new];

    [self.window makeKeyAndVisible];

    return YES;
}

@end