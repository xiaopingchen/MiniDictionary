//
//  Word.h
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic) NSMutableArray* translations;
@property(nonatomic,copy) NSString *phonetic;
@property(nonatomic)NSMutableArray *explains;
@property(nonatomic) NSMutableArray *webTranslation;

-(Word *)initWithDictionary:(NSDictionary *)dic;

@end
