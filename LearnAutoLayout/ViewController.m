//
//  ViewController.m
//  LearnAutoLayout
//
//  Created by Elliekuri on 16/5/4.
//  Copyright © 2016年 S.U.N. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewGridLayout.h"
#import "CollectionViewCell.h"
static NSString *myCollectionCell = @"mycollectionviewcell";

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong)    UICollectionView *mycollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //注册collectionviewlayout
    CollectionViewGridLayout *layout = [[CollectionViewGridLayout alloc]init];
    
    _mycollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
    [_mycollectionView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
    [_mycollectionView setBackgroundColor:[UIColor clearColor]];
    [_mycollectionView setDelegate:self];
    [_mycollectionView setDataSource:self];
    [self.view addSubview:_mycollectionView];
    
    [_mycollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:myCollectionCell];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- UICollectionViewDataSource
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
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:myCollectionCell forIndexPath:indexPath];
    [cell sizeToFit];
    return cell;
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelected");
}

@end
