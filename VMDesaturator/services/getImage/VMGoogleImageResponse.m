//
//  VMGoogleImageResponce.m
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import "VMGoogleImageResponse.h"
#import "VMImageProfile.h"

@implementation VMGoogleImageResponse
-(instancetype)initProfileWithData:(NSData *)data{
    self = [super init];
    if(self){
        NSError *convertError = nil;
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&convertError];
        if(convertError){
            self.resultCode = otherError;
            return self;
        }
        NSInteger code = [[response valueForKey:@"responseStatus"]integerValue];
        switch (code){
            case 200:
                self.resultCode = succsess;
                break;
   
            default:
                self.resultCode = otherError;
                break;
        }
        if (self.resultCode == succsess){
            @try{
                _privateProfiles = [[NSMutableArray alloc]init];
                NSArray *responseData = [response valueForKey:@"responseData"];
                NSArray *results = [responseData valueForKey:@"results"];
                for(id result in results){
                   VMImageProfile *profile = [[VMImageProfile alloc]init];
                   profile.title = [result valueForKey:@"title"];
                   profile.url = [NSURL URLWithString:[result valueForKey:@"url"]];
                   profile.tbUrl = [NSURL URLWithString:[result valueForKey:@"tbUrl"]];
                   profile.width = [result valueForKey:@"width"];
                   profile.height = [result valueForKey:@"height"];
                   profile.tbWidth = [result valueForKey:@"tbWidth"];
                   profile.tbHeight = [result valueForKey:@"tbHeight"];
                    [_privateProfiles addObject:profile];
                }
            }@catch(NSException *exception){
                self.resultCode = parseError;
            }
        }
    }
    return self;
}
@end
