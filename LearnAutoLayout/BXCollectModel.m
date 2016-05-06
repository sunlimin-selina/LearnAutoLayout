//
//  MAOMyCollect.m
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

#import "BXCollectModel.h"

@implementation BXCollectModel

+ (BXCollectModel *)modelSetValuesForKeysWithDictionary:(NSDictionary *)dictionary{

    BXCollectModel *model = [[BXCollectModel alloc] init];

    [model setValuesForKeysWithDictionary:dictionary];

    return model;
}


@end
