//
//  ViewController.m
//  Crossfit
//
//  Created by baidu on 16/1/4.
//  Copyright © 2016年 ThreeDot. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    NSLog(@"%@", @"test");
    [[self view] addSubview:loginViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
