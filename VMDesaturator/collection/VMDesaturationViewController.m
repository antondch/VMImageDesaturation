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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//Number of items in the collectionview
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imageProfiles count];
}

//Set up what each cell in the collectionview will look like
//Here is where you add the thumbnails and the on define what happens when the cell is clicked
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //initialize custom cell for the collectionview
    VMCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    [cell.imageView setClipsToBounds:YES];
    
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //format url to load image from
    VMImageProfile *profile = self.imageProfiles[indexPath.item];
//    NSString *url = [NSString stringWithFormat:.url];
    
    //load thumbnail
     [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:profile.url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
         dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = [UIImage imageWithData:data];
         });
        
    }];
    //Sets up taprecognizer for each cell. (onlcick)
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [cell addGestureRecognizer:tap];
    
    //sets cell's background color to black
    cell.backgroundColor=[UIColor blackColor];
    return cell;
}

//Sets size of cells in the collectionview
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}

//Sets what happens when a cell in the collectionview is selected (onlclicklistener)
- (void)handleTap:(UITapGestureRecognizer *)recognizer  {
//    //gets the cell thats was clicked
//    CustomCollectionCell *cell_test = (CustomCollectionCell *)recognizer.view;
//    
//    //gets indexpath of the cell
//    NSIndexPath *indexPath = [collectionViewThumbnails indexPathForCell:cell_test];
//    
//    if (isConnectedGal)
//    {
//        //sets the image that will be displayed in the photo browser
//        [photoGallery setInitialPageIndex:indexPath.row];
//        
//        //pushed photobrowser
//        [self.navigationController pushViewController:photoGallery animated:YES];
//    }
}

@end
