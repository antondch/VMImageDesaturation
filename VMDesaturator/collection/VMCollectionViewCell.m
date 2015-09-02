//
//  CollectionViewCell.m
//  VMDesaturator
//
//  Created by jessie on 02.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import "VMCollectionViewCell.h"

@implementation VMCollectionViewCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupImageView];
    }
    return self;
}

- (void)setupImageView {
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageView.autoresizingMask = UIViewAutoresizingNone;//UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.imageView];
}
@end
