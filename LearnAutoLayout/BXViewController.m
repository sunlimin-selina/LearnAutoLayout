//
//  ViewController.m
//  LearnAutoLayout
//
//  Created by Elliekuri on 16/5/4.
//  Copyright © 2016年 S.U.N. All rights reserved.
//

#import "BXViewController.h"
#import "BXCollectionViewGridLayout.h"
#import "BXCollectionViewCell.h"
#import "BXCollectModel.h"

NSString *const kBXCollectionCellIdentifier = @"bxcollectionviewcell";
static const CGFloat margin = 30.0f;


@interface BXViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)    UICollectionView *mycollectionView;
@property (nonatomic, strong)    NSMutableArray<BXCollectModel *> *modelsArray;

@end


@implementation BXViewController

#pragma mark - Getter
- (UICollectionView *)mycollectionView {
    if (!_mycollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;

        _mycollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
        [_mycollectionView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
        [_mycollectionView setBackgroundColor:[UIColor clearColor]];
        [_mycollectionView setDelegate:self];
        [_mycollectionView setDataSource:self];
    }
    return _mycollectionView;
}


#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:240.f/255.f green:240.f/255.f blue:240.f/255.f alpha:1];

    NSArray<NSDictionary *> *bxDataArray = @[
        @{@"icon":@"myicon.jpg",
          @"userInfo":@"User_102931023122",
          @"location":@"上海",
          @"pic":@"picture.jpg",@"productInfo":@"休闲度假、团队拓展、趣味活动团队旅游上海出发",@"productPrice":@"999元",@"updateTime":@"3分钟前",@"primeCost":@"1888元"},
       @{@"icon":@"myicon.jpg",@"userInfo":@"User_102931023122",@"location":@"上海",@"pic":@"picture.jpg",@"productInfo":@"休闲度假、团队拓展、趣味活动团队旅游上海出发",@"productPrice":@"999元",@"updateTime":@"3分钟前",@"primeCost":@"1888元"},
      @{@"icon":@"myicon.jpg",@"userInfo":@"User_102931023122",@"location":@"上海",@"pic":@"picture.jpg",@"productInfo":@"休闲度假、团队拓展、趣味活动团队旅游上海出发",@"productPrice":@"999元",@"updateTime":@"3分钟前",@"primeCost":@"1888元"}
    ];

    self.modelsArray = [[NSMutableArray alloc]init];

    [bxDataArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dictionary, NSUInteger idx, BOOL * _Nonnull stop) {
        BXCollectModel *model = [BXCollectModel modelWithDictionary:dictionary];
        [self.modelsArray addObject:model];
    }];


    [self.view addSubview:self.mycollectionView];
    //注册CollectionViewCell
    [self.mycollectionView registerClass:[BXCollectionViewCell class] forCellWithReuseIdentifier:kBXCollectionCellIdentifier];


}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {


    BXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBXCollectionCellIdentifier forIndexPath:indexPath];

    BXCollectModel* bxModel = self.modelsArray[indexPath.item];

    cell.iconView.image = [UIImage imageNamed:bxModel.iconUrl];
    cell.usrInfoLabel.text = bxModel.userInfo;
    cell.locationLabel.text = bxModel.locationInfo;
    cell.picView.image = [UIImage imageNamed:bxModel.pictureUrl];
    cell.infoLabel.text = bxModel.productInfo;
    cell.priceLabel.text = bxModel.productPrice;
    cell.timeLabel.text = bxModel.updateTime;

     return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"didSelected");
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat currentWidth = self.view.bounds.size.width;
    return (CGSize){(currentWidth - margin)/2, (currentWidth - margin)/2 + 60};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

@end
