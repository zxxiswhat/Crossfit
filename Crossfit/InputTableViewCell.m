//
//  InputTableViewCell.m
//  Crossfit
//
//  Created by baidu on 16/1/7.
//  Copyright © 2016年 ThreeDot. All rights reserved.
//

#import "InputTableViewCell.h"
#import "UIConstants.h"

#define kHeightCell 44.0
#define kOffsetSeprator 15.0

#define kWidthTitle 90.0
#define kWidthImage 25.0

@interface InputTableViewCell ()

- (void)initContentView;

@end

@implementation InputTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSLog(@"%@", @"in");
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"%@", @"in2");
        _maxLength = NSIntegerMax;
        _minLength = -1;
        [self initContentView];
    }
    return self;
}

- (void) updateField
{
    self.leftTextLabel.text = _titleText;
    UIImage *image = [UIImage imageNamed:_imagePath];
    _leftImageLabel.image = image;
    _valueTextField.placeholder = _placeHolder;
    
    switch (_inputCellStyle) {
        case kInputCellLeftIsImage:
            _leftTextLabel.hidden = YES;
            _leftImageLabel.hidden = NO;
            break;
            
        default:
            
            _leftTextLabel.hidden = NO;
            _leftImageLabel.hidden = YES;
            break;
    }
}

- (void) setDefaultCellLeftText:(NSString *)leftText andInputFieldPlaceHolder:(NSString *)placeHolder
{
    _titleText = leftText;
    _placeHolder = placeHolder;
    _inputCellStyle = kInputCellDefault;
    NSLog(@"%@", _titleText);
    [self updateField];
}

- (void) setLeftImageCellLeftImage:(NSString *)leftImage andInputFieldPlaceHolder:(NSString *)placeHolder
{
    _imagePath = leftImage;
    _placeHolder = placeHolder;
    _inputCellStyle = kInputCellLeftIsImage;
    [self updateField];
}

- (void) factoryOfInputTableViewCellByCellStyle:(InputCellStyle) inputCellStyle andLeftText:(NSString *)leftText andLeftImage:(NSString *)leftImage andInputFieldPlaceHolder:(NSString *)placeHolder
{
    switch (inputCellStyle) {
        case kInputCellDefault:
            [self setDefaultCellLeftText:leftText andInputFieldPlaceHolder:placeHolder];
            break;
        case kInputCellLeftIsImage:
            [self setLeftImageCellLeftImage:leftImage andInputFieldPlaceHolder:placeHolder];
            break;
    }
}



+ (InputTableViewCell*) getInputTableViewCellStyle:(InputCellStyle) inputCellStyle andLeftText:(NSString *)leftText andLeftImage:(NSString *)leftImage andInputFieldPlaceHolder:(NSString *)placeHolder
{
    static NSString *cellIdentifierInput = @"InputTableViewCell";
    InputTableViewCell *cell = [[InputTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifierInput];
    [cell factoryOfInputTableViewCellByCellStyle:inputCellStyle andLeftText:leftText andLeftImage:leftImage andInputFieldPlaceHolder:placeHolder];
    return cell;
}

- (void) initContentView
{
    //cellContentView
    _cellContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeightCell)];
    _cellContentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_cellContentView];

    //_leftTextLabel
    _leftTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _leftTextLabel.font = [UIFont boldSystemFontOfSize:15.0];
    _leftTextLabel.textColor = CFColorGray;
    _leftTextLabel.text = @" ";
    _leftTextLabel.backgroundColor = [UIColor clearColor];
    [_leftTextLabel sizeToFit];
    _leftTextLabel.frame = CGRectMake(kOffsetSeprator, (kHeightCell - CGRectGetHeight(_leftTextLabel.frame)) / 2 + 1, kWidthTitle, CGRectGetHeight(_leftTextLabel.frame));
    [self.cellContentView addSubview:_leftTextLabel];
    
    //leftImageLabel
    _leftImageLabel = [[UIImageView alloc] initWithFrame:CGRectZero];
    [_leftImageLabel sizeToFit];
    _leftImageLabel.frame = CGRectMake(kOffsetSeprator, (kHeightCell - CGRectGetHeight(_leftImageLabel.frame)) / 2 + 1, kWidthTitle, CGRectGetHeight(_leftImageLabel.frame));
    _leftImageLabel.hidden = YES;
    [self.cellContentView addSubview:_leftImageLabel];

    //....
    
    //valueTextField
    _valueTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftTextLabel.frame) + 5, 2, kScreenWidth - 130, kHeightCell - 2)];
    NSLog(@"%f", kScreenWidth);
    //_valueTextField.font = [UIFont systemFontOfSize:16.0];
    //_valueTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //_valueTextField.textColor = CFColorBlack;
    //_valueTextField.backgroundColor = [UIColor clearColor];
    [self.cellContentView addSubview:_valueTextField];
}

@end
