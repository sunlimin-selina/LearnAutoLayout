//
//  MAOCollectionViewCell.m
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

#import "CollectionViewCell.h"


@interface CollectionViewCell()
{
    UIView *superview;
    UIImageView *iconView;//头像view
    UILabel *usrInfoLabel;//用户信息label
    UILabel *locationLabel;//位置信息label
    
    UIImageView *picView;//图片view
    UILabel *infoLabel;//产品信息label
    UILabel *priceLabel;    //价格信息label

    UILabel *timeLabel;    //发布时间label
    UILabel *primeCostLabel;//原价信息label

}

@end

static const int margin = 8;


@implementation CollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        self.contentView.layer.borderColor = [[[UIColor alloc]initWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:0.5f] CGColor];
        self.contentView.layer.borderWidth = 0.5f;
        
        [self setupCollectionCellElement];
    }
    return self;
}

#pragma mark -- 将图片、icon、标识加入到cell上背景view上
-(void)setupCollectionCellElement{
    //头像view
    iconView = UIImageView.new;
    iconView.image = [UIImage imageNamed:@"myicon.jpg"];
    iconView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:iconView];
    
    //usrInfoLabel
    usrInfoLabel = UILabel.new;
    usrInfoLabel.numberOfLines = 1;
    usrInfoLabel.textColor = [UIColor blackColor];
    usrInfoLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    usrInfoLabel.text = @"Tippioooooooooooooooooooo";
    usrInfoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:usrInfoLabel];
    
    //LocationLabel
    locationLabel = UILabel.new;
    locationLabel.textColor = [UIColor redColor];
    locationLabel.textAlignment = NSTextAlignmentLeft;
    locationLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    locationLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    locationLabel.text = @"上海";
    locationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:locationLabel];
    
    //图片view
    picView = UIImageView.new;
    picView.image = [UIImage imageNamed:@"picture.jpg"];
    picView.backgroundColor = UIColor.redColor;
    picView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:picView];
    
    //产品信息label
    infoLabel = UILabel.new;
    infoLabel.text = @"组团去迪拜组团去迪拜组团去迪拜";
    infoLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    infoLabel.textColor = UIColor.blackColor;
    infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:infoLabel];
    
    //价格信息label
    priceLabel = UILabel.new;
    priceLabel.text = @"999元";
    priceLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    priceLabel.textColor = UIColor.redColor;
    priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:priceLabel];
    
    //原价信息label
    primeCostLabel = UILabel.new;
    primeCostLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSAttributedString *attrStr =
    [[NSAttributedString alloc]initWithString:@"1888元"
                                  attributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:14.f],
    NSForegroundColorAttributeName:UIColor.grayColor,
    NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),
    NSStrikethroughColorAttributeName:UIColor.grayColor}];
    
    primeCostLabel.attributedText = attrStr;
    [self addSubview:primeCostLabel];
    
    //发布时间label
    timeLabel = UILabel.new;
    timeLabel.text = @"3分钟前";
    timeLabel.font = [UIFont fontWithName:@"Helvetica" size:10.f];
    timeLabel.textColor = UIColor.grayColor;
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:timeLabel];

    superview = self;
    
    [self applyConstraintsToIconView];    //头像iconView约束
    
    [self applyConstraintsToUsrInfoLabel];//用户信息label约束
    
    [self applyConstraintsToLocationLabel];//locationLabel约束
    
    [self applyConstraintsToPicView];//图片view约束
    
    [self applyConstraintsToInfoLabel];//产品信息label约束
    
    [self applyConstraintsToPriceLabel];//价格信息label约束
    
    [self applyConstraintsToTimeLabel];//发布时间label约束
    
    [self applyConstraintsToPrimeCostLabel];//原价信息label约束
    
}

- (void)applyConstraintsToIconView{
    //头像iconView约束
    [superview addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:iconView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:iconView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:iconView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:picView
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:iconView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:iconView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:0.25
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:iconView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:0.2
                                                              constant:0],
                                ]];
    

    
}

- (void)applyConstraintsToUsrInfoLabel{
    
    [superview addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:iconView
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:locationLabel
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:iconView
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:0.5
                                                              constant:0],
                                
                                ]];
    
//    [usrInfoLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)applyConstraintsToLocationLabel{
    
    [superview addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:locationLabel
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:locationLabel
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:locationLabel
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:picView
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:locationLabel
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:locationLabel
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:iconView
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:2.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:locationLabel
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant:0],
                                ]];
}

- (void)applyConstraintsToPicView{
    
    [superview addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:picView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:iconView
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:picView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:0.5],
                                
                                [NSLayoutConstraint constraintWithItem:picView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:infoLabel
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:picView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:-0.5],
                                
                                [NSLayoutConstraint constraintWithItem:picView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant:-1],
                                
                                [NSLayoutConstraint constraintWithItem:picView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:0.5
                                                              constant:0],
                                ]];
}

- (void)applyConstraintsToInfoLabel{
    [superview addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:infoLabel
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:picView
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:infoLabel
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:infoLabel
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:priceLabel
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:infoLabel
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:infoLabel
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:usrInfoLabel
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1
                                                              constant:0],
                                ]];
}

- (void)applyConstraintsToPriceLabel{
 
    [superview addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:priceLabel
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:infoLabel
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:priceLabel
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:priceLabel
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:priceLabel
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:priceLabel
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:priceLabel
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:infoLabel
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:0.5
                                                              constant:0],
                                ]];
    
}

- (void)applyConstraintsToTimeLabel{
    
    [superview addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:timeLabel
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:infoLabel
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:timeLabel
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:margin],
                                
                                [NSLayoutConstraint constraintWithItem:timeLabel
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:timeLabel
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:timeLabel
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:0.9
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:timeLabel
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:priceLabel
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant:0],
                                ]];
    
}

- (void)applyConstraintsToPrimeCostLabel{
    
    CGSize priceLabelSize = [priceLabel.text sizeWithAttributes:
                   @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]}];
    //根据计算结果重新设置UILabel的尺寸
    
    [superview addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:primeCostLabel
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:priceLabel
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:primeCostLabel
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:priceLabel
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:priceLabelSize.width+5],
                                
                                [NSLayoutConstraint constraintWithItem:primeCostLabel
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:primeCostLabel
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:-margin],
                                
                                [NSLayoutConstraint constraintWithItem:primeCostLabel
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:0.5
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:primeCostLabel
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:priceLabel
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant:0],
                                ]];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    iconView.layer.cornerRadius = iconView.frame.size.width/2;
    [[iconView layer] setMasksToBounds:YES];
 }



@end
