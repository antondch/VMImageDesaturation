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
@interface VMPicSearchViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;


@end

@implementation VMPicSearchViewController

- (IBAction)searchButtonClicked:(id)sender {
    [self fetchPictures];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupComponents];
    [self setupServices];
}

-(void)setupComponents{
    self.searchTextField.delegate = self;
}

-(void)fetchPictures{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if(_imageService && ![self.searchTextField.text isEqualToString:@""]){
            [_imageService fetchDataForImageName:self.searchTextField.text withCallBackBlock:^(VMImageResponse *result){
                dispatch_sync(dispatch_get_main_queue(), ^{
                    VMDesaturationViewController *collectionController = [[VMDesaturationViewController alloc]init];
                    collectionController.imageProfiles = result.profiles;
                    [self.navigationController pushViewController:collectionController animated:YES];
                });
                
            }];
        }
    });
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self fetchPictures];
    return YES;
}

-(void)setupServices{
    _imageService = [[VMGoogleImageService alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
