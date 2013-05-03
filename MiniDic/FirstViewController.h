//
//  FirstViewController.h
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

-(void)transtate:(NSString *)word;

-(NSDictionary *)parseJson:(NSData *)data;


@end
