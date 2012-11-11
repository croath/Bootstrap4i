//
//  ViewController.m
//  bs4i
//
//  Created by  on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "BSButton.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BSButton *b1 = [[BSButton alloc] initWithType:BSButtonTypeDefault];
    [b1 setFrame:CGRectMake(100, 100, 100, 30)];
    [self.view addSubview:b1];
    [b1 release];
    
    BSButton *b2 = [[BSButton alloc] initWithType:BSButtonTypePrimary];
    [b2 setFrame:CGRectMake(100, 150, 100, 30)];
    [self.view addSubview:b2];
    [b2 release];
    
    BSButton *b3 = [[BSButton alloc] initWithType:BSButtonTypeInfo];
    [b3 setFrame:CGRectMake(100, 200, 100, 30)];
    [self.view addSubview:b3];
    [b3 release];
    
    BSButton *b4 = [[BSButton alloc] initWithType:BSButtonTypeSuccess];
    [b4 setFrame:CGRectMake(100, 250, 100, 30)];
    [self.view addSubview:b4];
    [b4 release];
    
    BSButton *b5 = [[BSButton alloc] initWithType:BSButtonTypeWarning];
    [b5 setFrame:CGRectMake(100, 300, 100, 30)];
    [self.view addSubview:b5];
    [b5 release];
    
    BSButton *b6 = [[BSButton alloc] initWithType:BSButtonTypeDanger];
    [b6 setFrame:CGRectMake(100, 350, 100, 30)];
    [self.view addSubview:b6];
    [b6 release];
    
    BSButton *b7 = [[BSButton alloc] initWithType:BSButtonTypeInverse];
    [b7 setFrame:CGRectMake(100, 400, 100, 30)];
    [self.view addSubview:b7];
    [b7 release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
