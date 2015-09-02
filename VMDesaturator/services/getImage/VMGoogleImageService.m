//
//  VMGoogleImageService.m
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import "VMGoogleImageService.h"
#import "VMGoogleImageResponse.h"

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
    NSString *body = [NSString stringWithFormat:@"%@?v=1.0&q=%@&resultFormat=text",APIURL,name];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:body]];
//    [request setHTTPMethod:@"POST"];
//    NSString *body = [NSString stringWithFormat:@"v=1.0&q=%@&resultFormat=text",name];
//    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    [request addValue:@"www.test.com" forHTTPHeaderField:@"Referer"];
    
    NSURLSessionDataTask *dataTask = [_session dataTaskWithRequest:request completionHandler:
                                      //callback block
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          if(error){
                                              callBackBlock(nil);
                                              return;
                                          }
                                          VMGoogleImageResponse *googleResponse = [[VMGoogleImageResponse alloc]initProfileWithData:data];
                                          //test***
                                          //         NSString *json = [[NSString alloc] initWithData:data
                                          //                                                encoding:NSUTF8StringEncoding];
                                          //*******
//                                          callBackBlock(googleResponse);
                                      }];//callback block
    
    [dataTask resume];
}
@end
