//
//  AIFServiceLockplatfrom.m
//  RTNetworking
//
//  Created by qinhubao on 15/11/29.
//  Copyright © 2015年 anjuke. All rights reserved.
//

#import "AIFServiceLockplatfrom.h"

@implementation AIFServiceLockplatfrom

#pragma mark - AIFServiceProtocal
/*
 @property (nonatomic, readonly) BOOL isOnline;
 
 @property (nonatomic, readonly) NSString *offlineApiBaseUrl;
 @property (nonatomic, readonly) NSString *onlineApiBaseUrl;
 
 @property (nonatomic, readonly) NSString *offlineApiVersion;
 @property (nonatomic, readonly) NSString *onlineApiVersion;
 
 @property (nonatomic, readonly) NSString *onlinePublicKey;
 @property (nonatomic, readonly) NSString *offlinePublicKey;
 
 @property (nonatomic, readonly) NSString *onlinePrivateKey;
 @property (nonatomic, readonly) NSString *offlinePrivateKey;
 */
- (BOOL)isOnline
{
    return YES;
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://120.24.180.238:8000/smartLock";
}

- (NSString *)onlineApiVersion
{
    return @"";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)onlinePublicKey
{
    return @"";
}

- (NSString *)offlineApiBaseUrl
{
    return @"";
}

- (NSString *)offlineApiVersion
{
    return @"";
}

- (NSString *)offlinePrivateKey
{
    return @"";
}

- (NSString *)offlinePublicKey
{
    return @"";
}

@end
