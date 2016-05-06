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

static NSString *BXCollectionCell = @"bxcollectionviewcell";

@interface BXCollectionViewCell()

@end

@implementation BXCollectionViewCell

+ (BXCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView AtIndexPath:(NSIndexPath *)indexPath andCollectModel:(BXCollectModel *)bxModel{
    
    BXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BXCollectionCell forIndexPath:indexPath];

    [cell setupCellElementWithModelData:bxModel];

    [cell sizeToFit];

    return cell;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        self.contentView.layer.borderColor = [[UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:0.5f] CGColor];
        self.contentView.layer.borderWidth = 0.5f;
        
    }
    return self;
}

#pragma mark - Getter
- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc]init];
        _iconView.layer.cornerRadius = 24.f;
        [_iconView.layer setMasksToBounds:YES];
        _iconView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _iconView;
}

- (UILabel *)usrInfoLabel{
    if (!_usrInfoLabel) {
        _usrInfoLabel = UILabel.new;
        _usrInfoLabel.numberOfLines = 1;
        _usrInfoLabel.textColor = [UIColor blackColor];
        _usrInfoLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _usrInfoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _usrInfoLabel;
}

- (UILabel *)locationLabel{
    if (!_locationLabel) {
        _locationLabel = UILabel.new;
        _locationLabel.textColor = [UIColor redColor];
        _locationLabel.textAlignment = NSTextAlignmentLeft;
        _locationLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        _locationLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _locationLabel.translatesAutoresizingMaskIntoConstraints = NO;

    }
    return _locationLabel;
}

- (UIImageView *)picView{
    if (!_picView) {
        _picView = UIImageView.new;
        _picView.backgroundColor = UIColor.redColor;
        _picView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _picView;
}

- (UILabel *)infoLabel{
    if (!_infoLabel) {
        _infoLabel = UILabel.new;
        _infoLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        _infoLabel.textColor = UIColor.blackColor;
        _infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _infoLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = UILabel.new;
        _priceLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        _priceLabel.textColor = UIColor.redColor;
        _priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _priceLabel;
}

- (UILabel *)primeCostLabel{
    if (!_primeCostLabel) {
        _primeCostLabel = UILabel.new;
        _primeCostLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSAttributedString *attrStr =
        [[NSAttributedString alloc]initWithString:@"1888元"
                                       attributes:
         @{NSFontAttributeName:[UIFont systemFontOfSize:14.f],
           NSForegroundColorAttributeName:UIColor.grayColor,
           NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),
           NSStrikethroughColorAttributeName:UIColor.grayColor}];
        
        _primeCostLabel.attributedText = attrStr;
    }
    return _primeCostLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = UILabel.new;
        _timeLabel.font = [UIFont fontWithName:@"Helvetica" size:10.f];
        _timeLabel.textColor = UIColor.grayColor;
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _timeLabel;
}

#pragma mark - Setup

- (void)setupCellElementWithModelData:(BXCollectModel *)bxModel{
    self.iconView.image = [UIImage imageNamed:bxModel.icon];
    self.usrInfoLabel.text = bxModel.usrInfo;
    self.locationLabel.text = bxModel.location;
    self.picView.image = [UIImage imageNamed:bxModel.pic];
    self.infoLabel.text = bxModel.productInfo;
    self.priceLabel.text = bxModel.productPrice;
    self.timeLabel.text = bxModel.updateTime;

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

- (void)applyConstraintsToIconView{
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:margin];
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_picView attribute:NSLayoutAttributeTop multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_usrInfoLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:-margin];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25f constant:noMargin];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:0.2f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,widthConstraint,heightConstraint]];

//    //使用Masonry
//    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(margin);
//        make.left.equalTo(self.mas_left).offset(margin);
//        make.bottom.equalTo(_picView.mas_top).offset(-margin);
//        make.right.equalTo(usrInfoLabel.mas_left).offset(-margin);
//        
//        make.width.equalTo(self.mas_width).multipliedBy(0.25);
//        make.height.equalTo(self.mas_height).multipliedBy(0.2);
//
//    }];
//    
}

- (void)applyConstraintsToUsrInfoLabel{

    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_usrInfoLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:margin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_usrInfoLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_iconView attribute:NSLayoutAttributeRight multiplier:1.0f constant:margin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_usrInfoLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_locationLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_usrInfoLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_usrInfoLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_iconView attribute:NSLayoutAttributeHeight multiplier:0.5f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,heightConstraint]];
    
//    [usrInfoLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    //使用Masonry
//    [usrInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(margin);
//        make.left.equalTo(_iconView.mas_right).offset(margin);
//        make.bottom.equalTo(locationLabel.mas_top);
//        make.right.equalTo(self.mas_right).offset(-margin);
//        
//        make.height.equalTo(_iconView.mas_height).multipliedBy(0.5);
//        
//    }];
    

}

- (void)applyConstraintsToLocationLabel{
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_locationLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_usrInfoLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_locationLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_usrInfoLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_locationLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_picView attribute:NSLayoutAttributeTop multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_locationLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_locationLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25f constant:0];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_locationLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_usrInfoLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,widthConstraint,heightConstraint]];
    
//    //使用Masonry
//    [locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(usrInfoLabel.mas_bottom);
//        make.left.equalTo(usrInfoLabel.mas_left);
//        make.bottom.equalTo(_picView.mas_top).offset(-margin);
//        make.right.equalTo(self.mas_right).offset(-margin);
//        
//        make.height.equalTo(usrInfoLabel.mas_height);
//        
//    }];
}

- (void)applyConstraintsToPicView{
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_picView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_iconView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:margin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_picView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_picView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_infoLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_picView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_picView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:0.5f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,heightConstraint]];

//        //使用Masonry
//        [picView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(_iconView.mas_bottom).offset(margin);
//            make.left.equalTo(self.mas_left).offset(0.5);
//            make.bottom.equalTo(infoLabel.mas_top).offset(-margin);
//            make.right.equalTo(self.mas_right).offset(-0.5);
//    
//            make.height.equalTo(self.mas_height).multipliedBy(0.5);
//            
//        }];

}

- (void)applyConstraintsToInfoLabel{
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_infoLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_picView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:margin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_infoLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_infoLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_priceLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_infoLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_infoLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_usrInfoLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:noMargin];

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

- (void)applyConstraintsToPriceLabel{

    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_priceLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_infoLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_priceLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_priceLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_priceLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_priceLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_infoLabel attribute:NSLayoutAttributeWidth multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_priceLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_infoLabel attribute:NSLayoutAttributeHeight multiplier:0.5f constant:noMargin];

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

- (void)applyConstraintsToTimeLabel{
    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_infoLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_timeLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_timeLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_timeLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_timeLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_priceLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,heightConstraint]];
    

//        //使用Masonry
//        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(infoLabel.mas_bottom);
//            make.left.equalTo(self.mas_left).offset(margin);
//            make.bottom.equalTo(self.mas_bottom).offset(-margin);
//            make.right.equalTo(self.mas_right).offset(-margin);
//    
//            make.height.equalTo(priceLabel);
//            
//        }];

}

- (void)applyConstraintsToPrimeCostLabel{
    
    CGSize priceLabelSize = [_priceLabel.text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]}];
    //根据计算结果重新设置UILabel的尺寸

    //NSLayoutConstraint添加约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_primeCostLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_priceLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:noMargin];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_primeCostLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_priceLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:priceLabelSize.width+5];

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_primeCostLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-margin];

    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_primeCostLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];

    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_primeCostLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.5f constant:noMargin];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_primeCostLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_priceLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:noMargin];

    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint,widthConstraint,heightConstraint]];

//            //使用Masonry
//            [_primeCostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
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
