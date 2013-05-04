//
//  CoreWord.h
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreWord : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phonetic;
@property (nonatomic, retain) NSString * explains;
@property (nonatomic, retain) NSString * detailTranslate;

@end
