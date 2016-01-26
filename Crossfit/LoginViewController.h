//
//  LoginViewController.h
//  Crossfit
//
//  Created by baidu on 16/1/8.
//  Copyright © 2016年 ThreeDot. All rights reserved.
//

#import <UIKit/UIKit.h>

// 基于UITableView的模式如下
//--------section 1---------
//==========================
//name row 0
//pass row 1
//==========================
//--------section 2--------
//addr row 0
//telephone row 1
//info row 2
//advice row 3
//---------------------------
// 第一层: section
// 第二层: row
// 一个section可以包含多个row，主要函数如下：
// numberOfSectionsInTableView: section的个数
// - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section : 某个section下面的行数row


@interface LoginViewController : UIViewController

@end
