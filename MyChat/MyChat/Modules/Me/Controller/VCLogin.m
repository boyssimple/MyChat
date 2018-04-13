//
//  VCLogin.m
//  LeftMaster
//
//  Created by simple on 2018/4/5.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "VCLogin.h"
#import "VCMain.h"
#import "AppDelegate.h"

@interface VCLogin ()<UITextFieldDelegate>
@property(nonatomic,strong)UIImageView *ivLogo;
@property(nonatomic,strong)UIImageView *ivBg;
@property(nonatomic,strong)UIImageView *ivUser;
@property(nonatomic,strong)UITextField *tfUser;
@property(nonatomic,strong)UIView *vLine;
@property(nonatomic,strong)UIImageView *ivPwd;
@property(nonatomic,strong)UITextField *tfPwd;
@property(nonatomic,strong)UIView *vTwoLine;
@property(nonatomic,strong)UIButton *btnLogin;
@property(nonatomic,strong)UIButton *btnForgot;
@end

@implementation VCLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMain];
}

- (void)initMain{
    [self.view addSubview:self.ivBg];
    [self.view addSubview:self.ivLogo];
    [self.view addSubview:self.ivUser];
    [self.view addSubview:self.tfUser];
    [self.view addSubview:self.vLine];
    [self.view addSubview:self.ivPwd];
    [self.view addSubview:self.tfPwd];
    [self.view addSubview:self.vTwoLine];
    [self.view addSubview:self.btnLogin];
    [self.view addSubview:self.btnForgot];
    
    self.tfUser.text = @"admin";
    self.tfPwd.text = @"123456";
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}


- (void)clickAction:(UIButton*)sender{
    NSInteger tag = sender.tag;
    if(tag == 101){
        
    }else{
        [self loginEvent];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)loginEvent{
    [self.view endEditing:YES];
    NSString *userName = self.tfUser.text ;
    NSString *password = self.tfPwd.text;
    
    if(userName.length < 2){
        [Toast showToast:@"手机号码错误!" with:self.view withTime:0.8];
        return;
    }
    
    if(password.length < 6){
        [Toast showToast:@"密码小于6位!" with:self.view withTime:0.8];
        return;
    }
    
    [AppUser share].userAccount = userName;
    [AppUser share].userPassword = password;
    
    [[MQTTManager share] loginWithUserName:userName withPassword:password];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (void)viewWillLayoutSubviews{
    CGRect r = self.ivLogo.frame;
    r.size.width = 90*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = (DEVICEWIDTH - r.size.width)/2.0;
    r.origin.y = 90*RATIO_WIDHT320;
    self.ivLogo.frame = r;
    
    r = self.ivUser.frame;
    r.size.width = 12*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = 16;
    r.origin.y = self.ivLogo.bottom +  40*RATIO_WIDHT320;
    self.ivUser.frame = r;
    
    r = self.tfUser.frame;
    r.size.width = DEVICEWIDTH - 32 - 12*RATIO_WIDHT320 - 40;
    r.size.height = 12*RATIO_WIDHT320;
    r.origin.x = self.ivUser.right + 20;
    r.origin.y = self.ivUser.top;
    self.tfUser.frame = r;
    
    r = self.vLine.frame;
    r.size.width = DEVICEWIDTH - 32;
    r.size.height = 0.5;
    r.origin.x = 16;
    r.origin.y = self.ivUser.bottom +  15*RATIO_WIDHT320;
    self.vLine.frame = r;
    
    r = self.ivPwd.frame;
    r.size.width = 12*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = 16;
    r.origin.y = self.vLine.bottom +  20*RATIO_WIDHT320;
    self.ivPwd.frame = r;
    
    r = self.tfPwd.frame;
    r.size.width = DEVICEWIDTH - 32 - 12*RATIO_WIDHT320 - 40;
    r.size.height = 12*RATIO_WIDHT320;
    r.origin.x = self.ivPwd.right + 20;
    r.origin.y = self.ivPwd.top;
    self.tfPwd.frame = r;
    
    r = self.vTwoLine.frame;
    r.size.width = DEVICEWIDTH - 32;
    r.size.height = 0.5;
    r.origin.x = 16;
    r.origin.y = self.ivPwd.bottom +  15*RATIO_WIDHT320;
    self.vTwoLine.frame = r;
    
    r = self.btnLogin.frame;
    r.size.width = DEVICEWIDTH - 32;
    r.size.height = 45*RATIO_WIDHT320;
    r.origin.x = 16;
    r.origin.y = self.vTwoLine.bottom +  40*RATIO_WIDHT320;
    self.btnLogin.frame = r;
    
    CGSize size = [self.btnForgot.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, 12*RATIO_WIDHT320)];
    r = self.btnForgot.frame;
    r.origin.x = DEVICEWIDTH - size.width - 21;
    r.origin.y = self.btnLogin.bottom + 15*RATIO_WIDHT320;
    r.size = size;
    self.btnForgot.frame = r;
}

- (UIImageView*)ivLogo{
    if (!_ivLogo) {
        _ivLogo = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivLogo.image = [UIImage imageNamed:@"logo"];
    }
    return _ivLogo;
}

- (UIImageView*)ivUser{
    if (!_ivUser) {
        _ivUser = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivUser.image = [UIImage imageNamed:@"Sign-in-icon_user"];
    }
    return _ivUser;
}

- (UITextField*)tfUser{
    if (!_tfUser) {
        _tfUser = [[UITextField alloc]initWithFrame:CGRectZero];
        _tfUser.placeholder = @"请输入手机号码";
        _tfUser.delegate = self;
    }
    return _tfUser;
}

- (UIView*)vLine{
    if (!_vLine) {
        _vLine = [[UIView alloc]initWithFrame:CGRectZero];
        _vLine.backgroundColor = RGB3(232);
    }
    return _vLine;
}

- (UIImageView*)ivPwd{
    if (!_ivPwd) {
        _ivPwd = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivPwd.image = [UIImage imageNamed:@"Sign-in-icon_Password"];
    }
    return _ivPwd;
}

- (UITextField*)tfPwd{
    if (!_tfPwd) {
        _tfPwd = [[UITextField alloc]initWithFrame:CGRectZero];
        _tfPwd.secureTextEntry = YES;
        _tfPwd.delegate = self;
    }
    return _tfPwd;
}

- (UIView*)vTwoLine{
    if (!_vTwoLine) {
        _vTwoLine = [[UIView alloc]initWithFrame:CGRectZero];
        _vTwoLine.backgroundColor = RGB3(232);
    }
    return _vTwoLine;
}

- (UIButton*)btnLogin{
    if (!_btnLogin) {
        _btnLogin = [[UIButton alloc]initWithFrame:CGRectZero];
        _btnLogin.backgroundColor = APP_COLOR;
        [_btnLogin setTitle:@"登录" forState:UIControlStateNormal];
        _btnLogin.titleLabel.font = [UIFont systemFontOfSize:14*RATIO_WIDHT320];
        [_btnLogin addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        _btnLogin.tag = 100;
        
    }
    return _btnLogin;
}

- (UIButton*)btnForgot{
    if (!_btnForgot) {
        _btnForgot = [[UIButton alloc]initWithFrame:CGRectZero];
        [_btnForgot setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_btnForgot setTitleColor:RGB(114, 113, 113) forState:UIControlStateNormal];
        [_btnForgot addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        _btnForgot.titleLabel.font = [UIFont systemFontOfSize:12*RATIO_WIDHT320];
        _btnForgot.tag = 101;
    }
    return _btnForgot;
}



@end
