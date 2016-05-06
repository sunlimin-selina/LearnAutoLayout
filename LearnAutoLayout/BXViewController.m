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

static NSString *BXCollectionCell = @"bxcollectionviewcell";

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

@interface BXViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong)    UICollectionView *mycollectionView;

@end

@implementation BXViewController

-(UICollectionView *)mycollectionView{
    if (!_mycollectionView) {
        BXCollectionViewGridLayout *layout = [[BXCollectionViewGridLayout alloc]init];

        _mycollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
        [_mycollectionView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
        [_mycollectionView setBackgroundColor:[UIColor clearColor]];
        [_mycollectionView setDelegate:self];
        [_mycollectionView setDataSource:self];
    }
    return _mycollectionView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:240.f/255.f green:240.f/255.f blue:240.f/255.f alpha:1];
    [self.view addSubview:self.mycollectionView];
    
    //注册CollectionViewCell
    [_mycollectionView registerClass:[BXCollectionViewCell class] forCellWithReuseIdentifier:BXCollectionCell];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* BXDataArray = @[@{@"icon":@"myicon.jpg",@"usrInfo":@"Tippiooooooooooo",@"location":@"上海",@"pic":@"picture.jpg",@"productInfo":@"组团去迪拜组团去迪拜组团去迪拜",@"productPrice":@"999元",@"updateTime":@"3分钟前",@"primeCost":@"1888元"}];

    BXCollectModel* CollectModel = [BXCollectModel modelSetValuesForKeysWithDictionary:BXDataArray[0]];

    BXCollectionViewCell *cell = [BXCollectionViewCell cellWithCollectionView:collectionView AtIndexPath:indexPath andCollectModel:CollectModel];

    return cell;
}



#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelected");
}

@end
