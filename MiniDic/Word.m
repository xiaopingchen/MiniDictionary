//
//  Word.m
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import "Word.h"

@implementation Word

-(Word *)initWithDictionary:(NSDictionary *)dic
{
    self=[super init];
    self.name=[dic objectForKey:@"query"];
    
    self.translations=[NSMutableArray new];
    for (NSString *value in [dic objectForKey:@"translation"]) {
        [self.translations addObject:value];
    }
    self.phonetic=[[dic objectForKey:@"basic"] objectForKey:@"phonetic"];
    self.explains=[NSMutableArray new];
    for (NSString *value in [[dic objectForKey:@"basic"] objectForKey:@"explains"]) {
        [self.explains addObject:value];
    }
    
    self.webTranslation=[NSMutableArray new];
    for (NSDictionary *value in [dic objectForKey:@"web"]) {
        NSMutableString *content=[NSMutableString new];
        for (NSString *v in [value objectForKey:@"value"]) {
            [content appendFormat   :@"%@ ",v];
        }
        [self.webTranslation addObject:[NSString stringWithFormat:@"%@:%@",[value objectForKey:@"key"],content]];
    }
    
    return self;
}

-(NSString *)description
{
    NSMutableString *des=[NSMutableString new];
    [des appendString:self.name];
    [des appendFormat:@"\n音标：%@\n",self.phonetic];
    
    for (NSString *value in self.explains) {
        [des appendString:value];
    }
    
    [des appendString:@"\n"];
    [des appendString:@"网络释义:\n"];
    
    for (NSString *value in self.webTranslation) {
        [des appendFormat:@"%@ \n",value];
    }
    
    

    return des;
}

@end
