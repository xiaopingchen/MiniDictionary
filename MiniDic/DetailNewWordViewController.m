//
//  SecondViewController.m
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import "DetailNewWordViewController.h"
#import "CoreWord.h"

@interface DetailNewWordViewController ()
{
    UILabel *lblName;
    UILabel *lblTranslate;
    CoreWord *word;
}


@end

@implementation DetailNewWordViewController

-(id)initWithWord:(CoreWord *)newWord
{
    self=[super init];
    if (self) {
        word=newWord;
        
        self.view.backgroundColor=[UIColor whiteColor];
        
        lblName=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
        lblName.textColor=[UIColor blackColor];
       // [self.view addSubview:lblName];
        
        lblTranslate=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
        lblTranslate.textColor=[UIColor blackColor];
        lblTranslate.numberOfLines=10;

        
        [self.view addSubview:lblTranslate];
        
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    lblName.text=word.name;
    lblTranslate.text=word.detailTranslate;
    
    CGSize translateSize=[lblTranslate.text sizeWithFont:lblTranslate.font constrainedToSize:CGSizeMake(300, 1000) lineBreakMode:NSLineBreakByClipping];
    lblTranslate.frame=CGRectMake(10, 10, 300, translateSize.height);

}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
