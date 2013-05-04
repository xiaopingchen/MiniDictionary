//
//  AppDelegate.m
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"

#import "DicDatabaseController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1, *viewController2;
    UINavigationController *indexNavController,*newWordNavController;
    
    viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController_iPhone" bundle:nil];
    indexNavController=[[UINavigationController alloc] initWithRootViewController:viewController1];
    //viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController_iPhone" bundle:nil];
    viewController2=[[DicDatabaseController alloc] init];
    newWordNavController=[[UINavigationController alloc] initWithRootViewController:viewController2];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[indexNavController, newWordNavController];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

-(NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel!=nil) {
        return _managedObjectModel;
    }
    
    _managedObjectModel=[NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}

-(NSPersistentStoreCoordinator *)persisttentStoreCoordinator
{
    if (_persisttentStoreCoordinator!=nil) {
        return _persisttentStoreCoordinator;
    }
    
    NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];

    NSURL *storeUrl=[NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"dic.sqlite"]];
    NSError *error=nil;
    _persisttentStoreCoordinator=[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    if (![_persisttentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
    
    return _persisttentStoreCoordinator;
}

-(NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext!=nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator=[self persisttentStoreCoordinator];
    if(coordinator!=nil)
    {
        _managedObjectContext=[[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
 // Optional UITabBarControllerDelegate method.
 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
 {
 }
 */

/*
 // Optional UITabBarControllerDelegate method.
 - (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
 {
 }
 */

@end
