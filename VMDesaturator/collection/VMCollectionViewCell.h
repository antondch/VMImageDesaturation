//
//  CollectionViewCell.h
//  VMDesaturator
//
//  Created by jessie on 02.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMImageProfile.h"

@interface VMCollectionViewCell : UICollectionViewCell{
    NSData *_raw;
}
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) VMImageProfile *profile;
@end
