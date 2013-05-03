//
//  FirstViewController.m
//  MiniDic
//
//  Created by chen xiaoping on 5/3/13.
//  Copyright (c) 2013 chen xiaoping. All rights reserved.
//

#import "FirstViewController.h"
#import "Word.h"
#import "CoreWord.h"
#import "AppDelegate.h"

@interface FirstViewController ()
{
    UITextField *inputView;
    UIScrollView *scrollView;
    UITextView *outputView;
    Word *word;
    AppDelegate *myDelegate;
}
-(void)beginTranslate:(id)sender;
-(void)addToDataBase:(id)sender;

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        inputView=[[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
        inputView.borderStyle=UITextBorderStyleRoundedRect;
        [self.view addSubview:inputView];
        
        UIButton *btnSearch=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnSearch.frame=CGRectMake(220, 10, 80, 40);
        [btnSearch setTitle:@"translate" forState:UIControlStateNormal];
        [btnSearch addTarget:self action:@selector(beginTranslate:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnSearch];
        
        double screenHeight=[[UIScreen mainScreen] applicationFrame].size.height;
        scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 60, 320-20, screenHeight-50)];
        [self.view addSubview:scrollView];
        
        outputView =[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 300, screenHeight-50)];
        [scrollView addSubview:outputView];
        
        UIButton *btnAdd=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnAdd.frame=CGRectMake(220, 60, 30, 30);
        [btnAdd setTitle:@"add" forState:UIControlStateNormal];
        [btnAdd addTarget:self action:@selector(addToDataBase:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnAdd];
    }
    return self;
}

-(void)addToDataBase:(id)sender
{
    CoreWord *coreWord=(CoreWord*)[NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:myDelegate.managedObjectContext];
    coreWord.name=word.name;
    coreWord.phonetic=word.phonetic;
    NSMutableString *temp=[NSMutableString new];
    for (NSString *value in word.explains) {
        [temp appendString:value];
    }
    coreWord.explains=temp;
    NSError *error=nil;
    BOOL isSaveSuccess=[myDelegate.managedObjectContext save:&error];
    if (isSaveSuccess) {
        NSLog(@"saved");
    }
}

-(void)beginTranslate:(id)sender
{
    [self transtate:inputView.text];
    [inputView resignFirstResponder];
}

-(void)transtate:(NSString *)keyword
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *urlPath=[NSString stringWithFormat:@"http://fanyi.youdao.com/openapi.do?keyfrom=minidictionary&key=2046055469&type=data&doctype=json&version=1.1&q=%@",keyword];
        NSURL *url=[[NSURL alloc] initWithString:urlPath];
        NSData *data=[NSData dataWithContentsOfURL:url];
        [self performSelectorOnMainThread:@selector(parseJson:) withObject:data waitUntilDone:YES];
    });
}

-(NSDictionary *)parseJson:(NSData *)data
{
    NSError *error;
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"content:%@",json);
    
    outputView.text=json.description;
    
    word=[[Word alloc]initWithDictionary:json];
    outputView.text=word.description;
    scrollView.contentSize=CGSizeMake(scrollView.contentSize.width, outputView.frame.size.height);
    return json;
}

							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
