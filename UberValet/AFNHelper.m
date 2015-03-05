//
//  AFNHelper.m
//  Tinder
//
//  Created by Elluminati - macbook on 04/04/14.
//  Copyright (c) 2014 AppDupe. All rights reserved.
//

#import "AFNHelper.h"
#import "AFNetworking.h"
#import "Constants.h"

@implementation AFNHelper

@synthesize strReqMethod;

#pragma mark -
#pragma mark - Init

-(id)initWithRequestMethod:(NSString *)method
{
    if ((self = [super init])) {
        self.strReqMethod=method;
    }
	return self;
}

#pragma mark -
#pragma mark - Methods

-(void)getDataFromPath:(NSString *)path withParamData:(NSMutableDictionary *)dictParam withBlock:(RequestCompletionBlock)block
{
    if (block) {
        dataBlock=[block copy];
    }
    //[raw urlEncodeUsingEncoding:NSUTF8Encoding]
    NSString *url=[[NSString stringWithFormat:@"%@%@",API_URL,path] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    if ([self.strReqMethod isEqualToString:POST_METHOD]) {
        [manager POST:url parameters:dictParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
            DLog(@"JSON: %@", responseObject);
            if (dataBlock) {
                dataBlock(responseObject,nil);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            DLog(@"Error: %@", error);
            if (dataBlock) {
                dataBlock(nil,error);
            }

        }];
    }
    else{
        [manager GET:url parameters:dictParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
            DLog(@"JSON: %@", responseObject);
            if (dataBlock) {
                dataBlock(responseObject,nil);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            DLog(@"Error: %@", error);
            if (dataBlock) {
                dataBlock(nil,error);
            }

        }];
    }
}

#pragma mark -
#pragma mark - Post methods(multipart image)

-(void)getDataFromPath:(NSString *)path withParamDataImage:(NSMutableDictionary *)dictParam andImage:(UIImage *)image withBlock:(RequestCompletionBlock)block
{
    if (block) {
        dataBlock=[block copy];
    }
    NSData *imageToUpload = UIImageJPEGRepresentation(image, 1.0);//(uploadedImgView.image);
    if (imageToUpload)
    {
        NSString *url=[[NSString stringWithFormat:@"%@%@",API_URL,path] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer.timeoutInterval=600;
        //NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
        [manager POST:url parameters:dictParam constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
        {
             [formData appendPartWithFileData:imageToUpload name:@"image_upload" fileName:@"image_upload.png" mimeType:@"png"];
        }
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
            DLog(@"Success: %@", responseObject);
                  if (dataBlock) {
                      dataBlock(responseObject,nil);
                  }
        }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            DLog(@"Error: %@", error);
                  if (dataBlock) {
                      dataBlock(nil,error);
                  }
        }];
    }
}


@end
