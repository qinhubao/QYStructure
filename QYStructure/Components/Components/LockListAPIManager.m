//
//  LockListAPIManager.m
//  RTNetworking
//
//  Created by qinhubao on 15/11/18.
//  Copyright © 2015年 anjuke. All rights reserved.
//

#import "LockListAPIManager.h"

@interface LockListAPIManager ()

@property (nonatomic, strong, readwrite) NSString *errorMessage;

@end

@implementation LockListAPIManager

//@synthesize errorMessage;

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
    }
    return self;
}

#pragma mark - lifycyle

#pragma mark - APIManager
- (NSString *)serviceType
{
    return kAIFServiceLockPlatform;
}

- (NSString *)methodName
{
    return @"AppServices/loginApp.action";
}

- (RTAPIManagerRequestType)requestType
{
    return RTAPIManagerRequestTypeRestGet;
}

#pragma mark - RTAPIManagerValidator

- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data{
    return YES;
}

- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    if (![data[@"loginUser"] hasPrefix:@"zhan"]) {
        self.errorMessage = @"用户名错误";
        return NO;
    }
    return YES;
}


#pragma mark - getter and setter


@end
