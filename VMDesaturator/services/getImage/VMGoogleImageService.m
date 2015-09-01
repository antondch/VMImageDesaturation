//
//  VMGoogleImageService.m
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import "VMGoogleImageService.h"
#import "VMImageResponse.h"

@implementation VMGoogleImageService
static NSString * const APIURL = @"https://ajax.googleapis.com/ajax/services/search/images";

-(instancetype)init{
    self = [super init];
    if(self){
        [self configSession];
    }
    return self;
}

-(void)configSession{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    _session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
}


-(void)fetchDataForImageName:(NSString *)name withCallBackBlock:(CallBackBlock)callBackBlock{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:APIURL]];
    [request setHTTPMethod:@"GET"];
    NSString *body = [NSString stringWithFormat:@"v=1.0&q=%@",name];
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask *dataTask = [_session dataTaskWithRequest:request completionHandler:
                                      //callback block
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          if(error){
                                              callBackBlock(nil);
                                              return;
                                          }
                                          VMImageResponse *googleResponse = [[VMImageResponse alloc]initProfileWithData:data];
                                          //test***
                                          //         NSString *json = [[NSString alloc] initWithData:data
                                          //                                                encoding:NSUTF8StringEncoding];
                                          //*******
                                          callBackBlock(googleResponse);
                                      }];//callback block
    
    [dataTask resume];
}
@end
