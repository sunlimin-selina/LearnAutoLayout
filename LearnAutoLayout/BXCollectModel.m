//
//  MAOMyCollect.m
//  MAONewProject
//
//  Created by lavi.dai on 15/8/7.
//  Copyright (c) 2015年 M.A.O. All rights reserved.
//

#import "BXCollectModel.h"

@implementation BXCollectModel

+ (BXCollectModel *)modelWithDictionary:(NSDictionary *)dictionary {

    return [[self alloc] initWithDictionary:dictionary];
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {

        self.userInfo = [dictionary objectForKey:@"userInfo"];
        self.iconUrl = [dictionary objectForKey:@"icon"];
        self.locationInfo = [dictionary objectForKey:@"location"];

        self.pictureUrl = [dictionary objectForKey:@"pic"];
        self.productInfo = [dictionary objectForKey:@"productInfo"];
        self.productPrice = [dictionary objectForKey:@"productPrice"];

        self.updateTime = [dictionary objectForKey:@"updateTime"];
        self.primeCost = [dictionary objectForKey:@"primeCost"];

    }

    return self;
}


@end
