//
//  LoginViewController.m
//  RTNetworking
//
//  Created by qinhubao on 16/1/3.
//  Copyright © 2016年 anjuke. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@property (nonatomic, strong) UITextField *tfUserName;
@property (nonatomic, strong) UITextField *tfPassword;
@property (nonatomic, strong) UITextField *tfDynamicCode;
@property (nonatomic, strong) UIButton *btnSendCode;
@property (nonatomic, strong) UIButton *btnLogin;

@end

@implementation LoginViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    [self initSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response

- (void)login:(UIButton *)sender {
    UIViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [UIApplication sharedApplication].delegate.window.rootViewController = navigationController;
//    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Private Method

- (void)initSubViews {
    
    self.title = NSLocalizedString(@"登录",@"");
    UIView *superview = self.view;
    // 用户名输入框增加约束
    [self.view addSubview:self.tfUserName];
    [self.tfUserName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottomLayoutGuide).multipliedBy(0.25).offset(10);
        make.right.equalTo(superview).offset(-20);
        make.left.equalTo(superview).offset(20);
    }];
    
    [self.view addSubview:self.tfPassword];
    [self.tfPassword makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tfUserName.bottom).offset(20);
        make.left.equalTo(superview).offset(20);
        make.right.equalTo(-20);
    }];
    
    [self.view addSubview:self.tfDynamicCode];
    [self.tfDynamicCode makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tfPassword.bottom).offset(20);
        make.right.equalTo(superview.right).multipliedBy(0.60).offset(-20);
        make.left.equalTo(superview).offset(20);
    }];
    
    [self.view addSubview:self.btnSendCode];
    [self.btnSendCode makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.tfDynamicCode.centerY);
        make.right.equalTo(superview).offset(-20);
        make.left.equalTo(self.tfDynamicCode.right).offset(20);
        //make.width.equalTo(@70);
        //make.bottom.equalTo(@(200));
    }];
    
    [self.view addSubview:self.btnLogin];
    [self.btnLogin makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btnSendCode.bottom).offset(20);
        make.right.equalTo(superview).offset(-20);
        make.left.equalTo(superview).offset(20);
    }];
    [self.btnLogin addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - Getter and Setter

- (UITextField *)tfUserName {
    if (!_tfUserName) {
        _tfUserName = [[UITextField alloc] init];
        [_tfUserName setPlaceholder:NSLocalizedString(@"输入用户名",@"")];
        [_tfUserName setBorderStyle:UITextBorderStyleRoundedRect];
        [_tfUserName setClearButtonMode:UITextFieldViewModeWhileEditing];
    }
    return _tfUserName;
}

- (UITextField *)tfPassword {
    if (!_tfPassword) {
        _tfPassword = [[UITextField alloc] init];
        [_tfPassword setPlaceholder:NSLocalizedString(@"输入密码", @"")];
        [_tfPassword setBorderStyle:UITextBorderStyleRoundedRect];
        [_tfPassword setClearButtonMode:UITextFieldViewModeWhileEditing];
    }
    return _tfPassword;
}

- (UITextField *)tfDynamicCode {
    if (!_tfDynamicCode) {
        _tfDynamicCode = [[UITextField alloc] init];
        [_tfDynamicCode setPlaceholder:NSLocalizedString(@"输入验证码", @"")];
        [_tfDynamicCode setBorderStyle:UITextBorderStyleRoundedRect];
        [_tfDynamicCode setClearButtonMode:UITextFieldViewModeWhileEditing];
    }
    return _tfDynamicCode;
}

- (UIButton *)btnLogin {
    if (!_btnLogin) {
        
        _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnLogin setTitle:NSLocalizedString(@"登录", @"") forState:UIControlStateNormal];
        [_btnLogin setTitle:NSLocalizedString(@"登录", @"") forState:UIControlStateHighlighted];
        [_btnLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnLogin setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        
    }
    return _btnLogin;
}

- (UIButton *)btnSendCode {
    if (!_btnSendCode) {

        _btnSendCode = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSendCode setTitle:NSLocalizedString(@"发送验证码", @"") forState:UIControlStateNormal];
        [_btnSendCode setTitle:NSLocalizedString(@"发送验证码", @"") forState:UIControlStateHighlighted];
        [_btnSendCode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnSendCode setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        
    }
    return _btnSendCode;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
