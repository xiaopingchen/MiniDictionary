//
//  AppDelegate.h
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property(strong,nonatomic) NSManagedObjectModel *managedObjectModel;
@property(strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property(strong,nonatomic) NSPersistentStoreCoordinator *persisttentStoreCoordinator;

-(NSPersistentStoreCoordinator *)persisttentStoreCoordinator;
-(NSManagedObjectModel *)managedObjectModel;
-(NSManagedObjectContext *)managedObjectContext;


@end
