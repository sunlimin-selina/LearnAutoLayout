//
//  MAOMyCollect.h
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

@import Foundation;



@interface BXCollectModel : NSObject


@property (nonatomic,strong) NSString *userInfo;     // 用户信息

@property (nonatomic,strong) NSString *iconUrl;      // 用户头像

@property (nonatomic,strong) NSString *locationInfo; // 位置信息

@property (nonatomic,strong) NSString *pictureUrl;   // 图片URL

@property (nonatomic,strong) NSString *productInfo;  // 产品信息

@property (nonatomic,strong) NSString *productPrice; // 产品价格

@property (nonatomic,strong) NSString *updateTime;   // 上传时间

@property (nonatomic,strong) NSString *primeCost;    // 产品原价


+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
