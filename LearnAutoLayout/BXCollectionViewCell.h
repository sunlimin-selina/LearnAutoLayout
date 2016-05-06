//
//  MAOCollectionViewCell.h
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BXCollectModel.h"

@class BXCollectModel;

@interface BXCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong, readonly) UIImageView *iconView;   //头像view
@property(nonatomic, strong, readonly) UILabel *usrInfoLabel;   //用户信息label

@property(nonatomic, strong, readonly) UILabel *locationLabel;  //位置信息label
@property(nonatomic, strong, readonly) UIImageView *picView;    //图片view
@property(nonatomic, strong, readonly) UILabel *infoLabel;      //产品信息label

@property(nonatomic, strong, readonly) UILabel *priceLabel;     //价格信息label
@property(nonatomic, strong, readonly) UILabel *timeLabel;      //发布时间label
@property(nonatomic, strong, readonly) UILabel *primeCostLabel; //原价信息label

@end
