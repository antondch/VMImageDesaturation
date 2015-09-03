//
//  VMDesaturationViewController.m
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import "VMDesaturationViewController.h"
#import "VMCollectionViewCell.h"

@interface VMDesaturationViewController ()

@end

@implementation VMDesaturationViewController
@synthesize imageProfiles = _imageProfiles;

-(void)loadView{
    if(_imageProfiles){
        self.navigationController.navigationBar.translucent = NO;
         self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [self setupCollectionView];
    }
}

-(void)setupCollectionView{
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    collectionViewThumbnails=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [collectionViewThumbnails setDataSource:self];
    [collectionViewThumbnails setDelegate:self];
    if (collectionViewThumbnails )
    {
        [collectionViewThumbnails setDataSource:self];
        [collectionViewThumbnails setDelegate:self];
        [collectionViewThumbnails registerClass:[VMCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        [collectionViewThumbnails setBackgroundColor:[UIColor blackColor]];
        [self.view addSubview:collectionViewThumbnails];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imageProfiles count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VMCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [cell.imageView setClipsToBounds:YES];
    
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;

    VMImageProfile *profile = self.imageProfiles[indexPath.item];
    cell.profile = profile;

    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [cell addGestureRecognizer:tap];
    
    cell.backgroundColor=[UIColor blackColor];
    return cell;
}

//Sets size of cells in the collectionview
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}

@end
