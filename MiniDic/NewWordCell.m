//
//  NewWordCell.m
//  MiniDic
//
//  Created by Mac mini on 13-5-4.
//  Copyright (c) 2013年 chen xiaoping. All rights reserved.
//

#import "NewWordCell.h"

@implementation NewWordCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 320, 20)];
        self.lblTitle.font=[UIFont fontWithName:@"Arial" size:24];
        self.lblExplain=[[UILabel alloc]initWithFrame:CGRectMake(10, 35, 320, 20)];
        
        [self addSubview:self.lblTitle];
        [self addSubview:self.lblExplain];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
