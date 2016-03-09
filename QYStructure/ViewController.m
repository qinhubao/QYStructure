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

static NSString * const kMASCellReuseIdentifier = @"kMASCellReuseIdentifier";

@interface ViewController () <RTAPIManagerParamSourceDelegate, RTAPIManagerApiCallBackDelegate, RTAPIManagerParamSourceDelegate, RTAPIManagerCallbackDataReformer, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LockListAPIManager *lockManager;
@property (nonatomic, strong) NSObject *testManagerInterceptor;
@property (nonatomic, strong) id<RTAPIManagerCallbackDataReformer> reformLock;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIScrollView *scrollerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArr;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArr = @[@"ab", @"cd", @"ab", @"cd", @"ab", @"cd", @"ab", @"cd", @"ab", @"cd", @"df"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.reformLock = self;
    //[self.view addSubview:self.label];
    self.navigationItem.title = NSLocalizedString(@"首页",@"");
    [self.lockManager loadData];
    self.reformLock = [[ListDataReformer alloc] init];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:kMASCellReuseIdentifier];
    [self initSubViews];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArr count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMASCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
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

#pragma mark - Private Method

- (void)initSubViews {
    [self.view addSubview:self.scrollerView];
    [self.scrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.scrollerView addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.bottom).multipliedBy(0.5).offset(20);
        make.left.equalTo(self.scrollerView.left).offset(20);
        make.right.equalTo(self.scrollerView).offset(-20);
        make.height.equalTo(25);
    }];
    
    [self.scrollerView addSubview:self.tableView];
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.bottom).offset(20);
        make.left.and.right.equalTo(self.scrollerView).offset(0);
        make.bottom.equalTo(self.scrollerView);
    }];
}

#pragma mark - Getter and Setter

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

- (UIScrollView *)scrollerView {
    if (!_scrollerView) {
        _scrollerView = [UIScrollView new];
    }
    return _scrollerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
