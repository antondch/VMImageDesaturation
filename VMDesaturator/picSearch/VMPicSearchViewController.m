//
//  PicSearchViewController.m
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import "VMPicSearchViewController.h"
#import "VMImageResponse.h"
#import "VMGoogleImageService.h"
#import "VMImageService.h"
#import "VMDesaturationViewController.h"
@interface VMPicSearchViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;


@end

@implementation VMPicSearchViewController
- (IBAction)searchButtonClicked:(id)sender {
    [self fetchPictures];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupServices];
}

-(void)fetchPictures{
    if(_imageService && ![self.searchTextField.text isEqualToString:@""]){
        [_imageService fetchDataForImageName:self.searchTextField.text withCallBackBlock:^(VMImageResponse *result){
            dispatch_sync(dispatch_get_main_queue(), ^{
                VMDesaturationViewController *collectionController = [[VMDesaturationViewController alloc]init];
                collectionController.imageProfiles = result.profiles;
                [self.navigationController pushViewController:collectionController animated:YES];
//                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:collectionController];
//                navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
//                [self presentViewController:navigationController animated:YES completion:nil];
            });

        }];
    }
}

-(void)setupServices{
    _imageService = [[VMGoogleImageService alloc]init];
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


@end
