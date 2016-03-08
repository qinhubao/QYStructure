//
//  ViewController.m
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "ViewController.h"
#import "LockListAPIManager.h"
#import "ListDataReformer.h"

@interface ViewController () <RTAPIManagerParamSourceDelegate, RTAPIManagerApiCallBackDelegate, RTAPIManagerParamSourceDelegate, RTAPIManagerCallbackDataReformer>
@property (nonatomic, strong) LockListAPIManager *lockManager;
@property (nonatomic, strong) NSObject *testManagerInterceptor;
@property (nonatomic, strong) id<RTAPIManagerCallbackDataReformer> reformLock;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController


#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.reformLock = self;
    [self.view addSubview:self.label];
    self.navigationItem.title = @"标题";
    [self.lockManager loadData];
    self.reformLock = [[ListDataReformer alloc] init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (LockListAPIManager *)lockManager
{
    if (_lockManager == nil) {
        _lockManager = [[LockListAPIManager alloc] init];
        _lockManager.delegate = self;
        _lockManager.paramSource = self;
        _lockManager.interceptor = nil;//self.testManagerInterceptor;
    }
    return _lockManager;
}


- (UILabel *)label{
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
        [_label setTextColor:[UIColor blackColor]];
        [_label setText:@"Test"];
    }
    return _label;
}

#pragma mark - RTAPIManagerApiCallBackDelegate
- (void)managerCallAPIDidSuccess:(RTAPIBaseManager *)manager{
    
    id result = [manager fetchDataWithReformer:self.reformLock];
    NSDictionary *dic ;
    if ([result isKindOfClass:[NSDictionary class]]) {
        dic = result;
    } else if ([result isKindOfClass:[NSData class]]){
        dic = @{@"data":result};
    }
    NSLog(@"返回结果%@", dic);
    [self.label setText:dic[@"data"]];
    
    
}
- (void)managerCallAPIDidFailed:(RTAPIBaseManager *)manager{
    NSLog(@"failed: %@", [manager fetchDataWithReformer:nil]);
    if (manager.errorType == RTAPIManagerErrorTypeParamsError
        && [manager fetchDataWithReformer:nil] == nil
        && manager.errorMessage != nil) {
        [self.label setText:manager.errorMessage];
    }
}


#pragma mark - RTAPIManagerCallbackDataReformer
- (id)manager:(RTAPIBaseManager *)manager reformData:(NSDictionary *)data{
    NSDictionary *dic = data;
    return dic;
}

#pragma mark - RTAPIManagerParamSourceDelegate
- (NSDictionary *)paramsForApi:(RTAPIBaseManager *)manager{

    return @{@"loginUser":@"lisi", @"password":@"123456", @"userType":@(1)};
}


@end
