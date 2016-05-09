//
//  MAOMyCollect.h
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

@import Foundation;



@interface BXCollectModel : NSObject


@property (nonatomic, copy) NSString *userInfo;     // 用户信息
@property (nonatomic, copy) NSString *iconUrl;      // 用户头像
@property (nonatomic, copy) NSString *locationInfo; // 位置信息
@property (nonatomic, copy) NSString *pictureUrl;   // 图片URL
@property (nonatomic, copy) NSString *productInfo;  // 产品信息
@property (nonatomic, copy) NSString *productPrice; // 产品价格
@property (nonatomic, copy) NSString *updateTime;   // 上传时间
@property (nonatomic, copy) NSString *primeCost;    // 产品原价


+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
