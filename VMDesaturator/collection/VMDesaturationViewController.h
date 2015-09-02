//
//  VMDesaturationViewController.h
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMImageProfile.h"

@interface VMDesaturationViewController : UICollectionViewController{
    UICollectionView *collectionViewThumbnails;
    NSArray *_imageProfiles;
}
@property (nonatomic, strong) NSArray *imageProfiles;
@end
