//
//  VCMe.m
//  MyChat
//
//  Created by simple on 2018/4/12.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "VCMe.h"

@interface VCMe ()

@end

@implementation VCMe

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, DEVICEWIDTH - 20, 40)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickAction{
    Message *msg = [[Message alloc]init];
    msg.fromAccount = [AppUser share].userAccount;
    msg.fromUserNick = @"罗伟";
    msg.toAccount = @"admin";
    msg.msg = @"你好";
    msg.msgType = MessageTypeChat;
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MM:ss";
    msg.time = [formatter stringFromDate:date];
    [[MQTTManager share] sendMessage:msg];
}

@end
