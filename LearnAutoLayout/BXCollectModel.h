//
//  MAOMyCollect.h
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BXCollectModel : NSObject

@property (nonatomic,strong) NSString *usrInfo;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *location;
@property (nonatomic,strong) NSString *pic;
@property (nonatomic,strong) NSString *productInfo;//类型Id
@property (nonatomic,strong) NSString *productPrice;
@property (nonatomic,strong) NSString *updateTime;
@property (nonatomic,strong) NSString *primeCost;

+ (BXCollectModel *)modelSetValuesForKeysWithDictionary:(NSDictionary *)dictionary;


@end
