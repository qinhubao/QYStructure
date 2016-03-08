//
//  ListDataReformer.m
//  RTNetworking
//
//  Created by qinhubao on 15/12/22.
//  Copyright © 2015年 anjuke. All rights reserved.
//

#import "ListDataReformer.h"
#import "NSData+Crypto.h"

@implementation ListDataReformer

#pragma mark - RTAPIManagerCallbackDataReformer
- (id)manager:(RTAPIBaseManager *)manager reformData:(NSDictionary *)data{
    
    
    NSDictionary *dic = @{@"data":@"aba"};
    return dic;
}
@end
