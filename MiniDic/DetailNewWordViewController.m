//
//  SecondViewController.m
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailNewWordViewController.h"
#import "CoreWord.h"
#import "MBProgressHUD.h"

#define NAVIGATIONBARHEIGHT 44.0f
#define TABBARHEIGHT    44.0f

@interface DetailNewWordViewController ()
{
    UILabel *lblName;
    UILabel *lblTranslate;
    UIScrollView *contentScrollView;
    
    CoreWord *word;
    AppDelegate *myDelegate;
}

-(void)removeWord:(CoreWord *)word;
-(void)remove:(id)sender;
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
        lblTranslate.numberOfLines=0;
        
        
        // [self.view addSubview:lblTranslate];
        // self.view.backgroundColor=[UIColor redColor];
        double screenHeight=[[UIScreen mainScreen]applicationFrame].size.height;
        
        contentScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, screenHeight-NAVIGATIONBARHEIGHT-TABBARHEIGHT)];
        [self.view addSubview:contentScrollView];
        
        [contentScrollView addSubview:lblTranslate];
        
        UIBarButtonItem *removeBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleBordered target:self action:@selector(remove:)];
        self.navigationItem.rightBarButtonItem=removeBarButtonItem;
        
        //self.navigationController.navigationItem.rightBarButtonItem=[UIBarButtonItem alloc]initWithBarButtonSystemItem:uibar target:<#(id)#> action:<#(SEL)#>
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
    
    lblTranslate.frame=CGRectMake(10, 10, 300, 1000000);
    [lblTranslate sizeToFit];
    
    contentScrollView.contentSize=CGSizeMake(lblTranslate.frame.size.width, lblTranslate.frame.size.height+15);
}

-(void)remove:(id)sender
{
    [self removeWord:word];
}

-(void)removeWord:(CoreWord *)deleteWord
{
    [myDelegate.managedObjectContext deleteObject:deleteWord];
    NSError *error=nil;
    BOOL succeed= [myDelegate.managedObjectContext save:&error];
    if (succeed) {
        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText=@"删除成功";
        hud.mode=MBProgressHUDModeText;
        [hud hide:YES afterDelay:3];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    myDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
