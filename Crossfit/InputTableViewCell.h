//
//  InputTableViewCell.h
//  Crossfit
//
//  Created by baidu on 16/1/7.
//  Copyright © 2016年 ThreeDot. All rights reserved.
//

#import <UIKit/UIKit.h>

// 基于UITableViewCell做的输入模式
// 有2种模式: 第一种是左边是textlabel, 中间是inputfield；第二种是左边是imagelabel，中间是inputfield

typedef enum _InputCellStyle {
    kInputCellDefault = 1, // input cell left is label
    kInputCellLeftIsImage, // input cell left is image
} InputCellStyle;

@class InputTableViewCell;

@protocol InputTableViewCellDelegate <NSObject>

//- (void)completeInputByCell:(InputTableViewCell *)cell;
//- (void)inCompleteInputByCell:(InputTableViewCell *)cell;

@optional
- (void)beginInputByCell:(InputTableViewCell *)cell;
- (void)endInputByCell:(InputTableViewCell *)cell;
- (void)clearInputByCell:(InputTableViewCell *)cell;

@end

@interface InputTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *cellContentView;

@property (nonatomic, strong) UILabel *leftTextLabel;
@property (nonatomic, strong) UIImageView *leftImageLabel;
@property (nonatomic, strong) UITextField *valueTextField;
@property InputCellStyle inputCellStyle;      //用于设置textfield文本

@property (assign, nonatomic) BOOL displayPassword;         //用于显示密码
@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, assign) NSInteger minLength;

@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *imagePath;

@property (strong, nonatomic) NSString *placeHolder;      //用于设置textfield文本

- (void) initContentView;
- (void) setDefaultCellLeftText:(NSString *)leftText andInputFieldPlaceHolder:(NSString *)placeHolder;
- (void) setLeftImageCellLeftImage:(NSString *)leftImage andInputFieldPlaceHolder:(NSString *)placeHolder;
+ (InputTableViewCell*) getInputTableViewCellStyle:(InputCellStyle) inputCellStyle andLeftText:(NSString *)leftText andLeftImage:(NSString *)leftImage andInputFieldPlaceHolder:(NSString *)placeHolder;
- (void) updateField;

@end
