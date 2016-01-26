//
//  LoginViewController.m
//  Crossfit
//
//  Created by baidu on 16/1/8.
//  Copyright © 2016年 ThreeDot. All rights reserved.
//

#import "LoginViewController.h"
#import "InputTableViewCell.h"
#import "Constants.h"
#import "UIConstants.h"
#define LOGIN_TABLE_ROW 2
#define LOGIN_SECTION_NUM 1

#define IndexRowAccount 0
#define IndexRowPass    1

@interface LoginViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableview;
@property (strong, nonatomic) UIButton *button;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, kScreenWidth, 100)];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    NSLog(@"%@", @"test");
    [self.view addSubview:_tableview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return LOGIN_TABLE_ROW;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return LOGIN_SECTION_NUM;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *inputTableViewCell = nil;
    NSLog(@"%@", @"what");
    switch (indexPath.row) {
        case IndexRowAccount:
            //inputTableViewCell = [InputTableViewCell getInputTableViewCellStyle:kInputCellDefault andLeftText:NSLocalizedString(kLoginAccount, nil) andLeftImage:nil andInputFieldPlaceHolder:@"账号"];
            inputTableViewCell = [InputTableViewCell getInputTableViewCellStyle:kInputCellDefault andLeftText:@"Account" andLeftImage:nil andInputFieldPlaceHolder:@"账号"];
            break;
        case IndexRowPass:
            inputTableViewCell = [InputTableViewCell getInputTableViewCellStyle:kInputCellDefault andLeftText:NSLocalizedString(kLoginPassword, nil) andLeftImage:nil andInputFieldPlaceHolder:@"密码"];
            break;
        default:
            NSLog(@"%@", @"error");
            break;
    }
    return inputTableViewCell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
