//
//  MAOMyCollect.h
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BXCollectModel : NSObject

/**用户信息*/
@property (nonatomic,strong) NSString *usrInfo;

/**用户头像*/
@property (nonatomic,strong) NSString *icon;

/**位置信息*/
@property (nonatomic,strong) NSString *location;

/**产品图片*/
@property (nonatomic,strong) NSString *pic;

/**产品信息*/
@property (nonatomic,strong) NSString *productInfo;

/**产品价格*/
@property (nonatomic,strong) NSString *productPrice;

/**上传时间*/
@property (nonatomic,strong) NSString *updateTime;

/**产品原价*/
@property (nonatomic,strong) NSString *primeCost;


+ (BXCollectModel *)modelSetValuesForKeysWithDictionary:(NSDictionary *)dictionary;


@end
