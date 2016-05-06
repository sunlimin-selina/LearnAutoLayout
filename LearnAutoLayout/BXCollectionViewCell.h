//
//  MAOCollectionViewCell.h
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BXCollectModel.h"

@interface BXCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong) UIImageView *iconView;//头像view
@property(nonatomic,strong) UILabel *usrInfoLabel;//用户信息label

@property(nonatomic,strong) UILabel *locationLabel;//位置信息label
@property(nonatomic,strong) UIImageView *picView;//图片view
@property(nonatomic,strong) UILabel *infoLabel;//产品信息label

@property(nonatomic,strong) UILabel *priceLabel;    //价格信息label
@property(nonatomic,strong) UILabel *timeLabel;    //发布时间label
@property(nonatomic,strong) UILabel *primeCostLabel;//原价信息label

+ (BXCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView AtIndexPath:(NSIndexPath *)indexPath andCollectModel:(BXCollectModel *)bxModel;

@end
