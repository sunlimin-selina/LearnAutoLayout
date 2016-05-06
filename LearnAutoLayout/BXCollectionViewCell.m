//
//  MAOCollectionViewCell.m
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

#import "BXCollectionViewCell.h"
#import <Masonry/Masonry.h>

static const CGFloat margin = 8.0f;
static const CGFloat noMargin = 0.0f;

@interface BXCollectionViewCell()

@property(nonatomic, strong) UIImageView *iconView;   //头像view
@property(nonatomic, strong) UILabel *usrInfoLabel;   //用户信息label

@property(nonatomic, strong) UILabel *locationLabel;  //位置信息label
@property(nonatomic, strong) UIImageView *picView;    //图片view
@property(nonatomic, strong) UILabel *infoLabel;      //产品信息label

@property(nonatomic, strong) UILabel *priceLabel;     //价格信息label
@property(nonatomic, strong) UILabel *timeLabel;      //发布时间label
@property(nonatomic, strong) UILabel *primeCostLabel; //原价信息label

@end

@implementation BXCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];

        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.usrInfoLabel];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.picView];
        [self.contentView addSubview:self.infoLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.primeCostLabel];
        [self.contentView addSubview:self.timeLabel];

        [self applyConstraintsToIconView];       // 头像_iconView约束
        [self applyConstraintsToUsrInfoLabel];   // 用户信息label约束
        [self applyConstraintsToLocationLabel];  // locationLabel约束
        [self applyConstraintsToPicView];        // 图片view约束
        [self applyConstraintsToInfoLabel];      // 产品信息label约束
        [self applyConstraintsToPriceLabel];     // 价格信息label约束
        [self applyConstraintsToTimeLabel];      // 发布时间label约束
        [self applyConstraintsToPrimeCostLabel]; // 原价信息label约束

    }
    return self;
}

#pragma mark - Getter
- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc]init];
        _iconView.translatesAutoresizingMaskIntoConstraints = NO;
        _iconView.layer.cornerRadius = self.contentView.frame.size.width*0.125;
        [_iconView.layer setMasksToBounds:YES];
    }
    return _iconView;
}

- (UILabel *)usrInfoLabel {
    if (!_usrInfoLabel) {
        _usrInfoLabel = [UILabel new];
        _usrInfoLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _usrInfoLabel.numberOfLines = 1;
        _usrInfoLabel.textColor = [UIColor blackColor];
        _usrInfoLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _usrInfoLabel;
}

- (UILabel *)locationLabel {
    if (!_locationLabel) {
        _locationLabel = [UILabel new];
        _locationLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _locationLabel.textColor = [UIColor redColor];
        _locationLabel.textAlignment = NSTextAlignmentLeft;
        _locationLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        _locationLabel.lineBreakMode = NSLineBreakByTruncatingTail;

    }
    return _locationLabel;
}

- (UIImageView *)picView {
    if (!_picView) {
        _picView = [UIImageView new];
        _picView.translatesAutoresizingMaskIntoConstraints = NO;
        _picView.backgroundColor = UIColor.redColor;
    }
    return _picView;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel new];
        _infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _infoLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        _infoLabel.textColor = UIColor.blackColor;
    }
    return _infoLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _priceLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        _priceLabel.textColor = UIColor.redColor;
    }
    return _priceLabel;
}

- (UILabel *)primeCostLabel {
    if (!_primeCostLabel) {
        _primeCostLabel = [UILabel new];
        _primeCostLabel.translatesAutoresizingMaskIntoConstraints = NO;

        NSDictionary* attributedDic = @{NSFontAttributeName:[UIFont systemFontOfSize:14.f],
                                       NSForegroundColorAttributeName:UIColor.grayColor,
                                       NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),
                                        NSStrikethroughColorAttributeName:UIColor.grayColor};
        NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:@"1888元" attributes:attributedDic];
        
        _primeCostLabel.attributedText = attrStr;
    }
    return _primeCostLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _timeLabel.font = [UIFont fontWithName:@"Helvetica" size:10.f];
        _timeLabel.textColor = UIColor.grayColor;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

#pragma mark - applyConstraints
- (void)applyConstraintsToIconView {
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.iconView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:margin];
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.iconView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.iconView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.picView attribute:NSLayoutAttributeTop multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.iconView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.usrInfoLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:-margin];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.iconView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25f constant:noMargin];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.iconView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,widthConstraint,heightConstraint]];

//    //使用Masonry
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(margin);
//        make.left.equalTo(self.mas_left).offset(margin);
//        make.bottom.equalTo(self.picView.mas_top).offset(-margin);
//        make.right.equalTo(usrInfoLabel.mas_left).offset(-margin);
//        
//        make.width.equalTo(self.mas_width).multipliedBy(0.25);
//        make.height.equalTo(self.mas_height).multipliedBy(0.2);
//
//    }];
//    
}

- (void)applyConstraintsToUsrInfoLabel {

    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.usrInfoLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:margin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.usrInfoLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.iconView attribute:NSLayoutAttributeRight multiplier:1.0f constant:margin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.usrInfoLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.locationLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.usrInfoLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.usrInfoLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.iconView attribute:NSLayoutAttributeHeight multiplier:0.5f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,heightConstraint]];
    
//    [usrInfoLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    //使用Masonry
//    [usrInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(margin);
//        make.left.equalTo(self.iconView.mas_right).offset(margin);
//        make.bottom.equalTo(locationLabel.mas_top);
//        make.right.equalTo(self.mas_right).offset(-margin);
//        
//        make.height.equalTo(self.iconView.mas_height).multipliedBy(0.5);
//        
//    }];
    

}

- (void)applyConstraintsToLocationLabel {
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.locationLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.usrInfoLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.locationLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.usrInfoLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.locationLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.picView attribute:NSLayoutAttributeTop multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.locationLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.locationLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25f constant:0];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.locationLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.usrInfoLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,widthConstraint,heightConstraint]];
    
//    //使用Masonry
//    [locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(usrInfoLabel.mas_bottom);
//        make.left.equalTo(usrInfoLabel.mas_left);
//        make.bottom.equalTo(self.picView.mas_top).offset(-margin);
//        make.right.equalTo(self.mas_right).offset(-margin);
//        
//        make.height.equalTo(usrInfoLabel.mas_height);
//        
//    }];
}

- (void)applyConstraintsToPicView {
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.picView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.iconView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:margin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.picView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.picView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.infoLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.picView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.picView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:0.5f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,heightConstraint]];

//        //使用Masonry
//        [picView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.iconView.mas_bottom).offset(margin);
//            make.left.equalTo(self.mas_left).offset(0.5);
//            make.bottom.equalTo(infoLabel.mas_top).offset(-margin);
//            make.right.equalTo(self.mas_right).offset(-0.5);
//    
//            make.height.equalTo(self.mas_height).multipliedBy(0.5);
//            
//        }];

}

- (void)applyConstraintsToInfoLabel {
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.picView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:margin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.priceLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.usrInfoLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,heightConstraint]];

//    //使用Masonry
//    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(picView.mas_bottom).offset(margin);
//        make.left.equalTo(self.mas_left).offset(margin);
//        make.bottom.equalTo(priceLabel.mas_top);
//        make.right.equalTo(self.mas_right).offset(-margin);
//        
//        make.height.equalTo(usrInfoLabel.mas_height);
//        
//    }];

}

- (void)applyConstraintsToPriceLabel {

    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.priceLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.infoLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:margin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.priceLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.priceLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.priceLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.priceLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.infoLabel attribute:NSLayoutAttributeWidth multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.priceLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.infoLabel attribute:NSLayoutAttributeHeight multiplier:0.5f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,widthConstraint,heightConstraint]];

//    //使用Masonry
//    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(infoLabel.mas_bottom);
//        make.left.equalTo(self.mas_left).offset(margin);
//        make.bottom.equalTo(self.mas_bottom).offset(-margin);
//        make.right.equalTo(self.mas_right).offset(-margin);
//        
//        make.width.height.equalTo(infoLabel);
//        
//    }];

    
}

- (void)applyConstraintsToTimeLabel {
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.priceLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.timeLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.timeLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.timeLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.timeLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.priceLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,heightConstraint]];
    

//        //使用Masonry
//        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(infoLabel.mas_bottom);
//            make.left.equalTo(self.mas_left).offset(margin);
//            make.bottom.equalTo(self.mas_bottom).offset(-margin);
//            make.right.equalTo(self.mas_right).offset(-margin);
//    
//            make.height.equalTo(priceLabel);
//            
//        }];

}

- (void)applyConstraintsToPrimeCostLabel {
    
//    CGSize priceLabelSize = [self.priceLabel.text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]}];
    //根据计算结果重新设置UILabel的尺寸

    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.primeCostLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.priceLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.primeCostLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.priceLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:50];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.primeCostLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.primeCostLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.primeCostLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.5f constant:noMargin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.primeCostLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.priceLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,widthConstraint,heightConstraint]];

//            //使用Masonry
//            [self.primeCostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(priceLabel.mas_top);
//                make.left.equalTo(priceLabel.mas_left).offset(priceLabelSize.width+5);
//                make.bottom.equalTo(self.mas_bottom).offset(-margin);
//                make.right.equalTo(self.mas_right).offset(-margin);
//    
//                make.width.equalTo(self.mas_width).multipliedBy(0.5);
//                make.height.equalTo(priceLabel);
//                
//            }];
    
}


@end
