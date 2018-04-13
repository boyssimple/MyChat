//
//  VCChat.m
//  MyChat
//
//  Created by simple on 2018/4/12.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "VCChat.h"
#import "AppDelegate.h"

@interface VCChat ()<MQTTSessionDelegate>

@end

@implementation VCChat

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickAction{
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    NSString * str =@"str";
//    
//    NSData *data =[str dataUsingEncoding:NSUTF8StringEncoding];
//    appDelegate.session.delegate = self;
//    [appDelegate.session publishAndWaitData:data
//                        onTopic:@"/World"
//                         retain:NO
//                            qos:MQTTQosLevelAtLeastOnce];
}


- (void)newMessage:(MQTTSession *)session data:(NSData *)data onTopic:(NSString *)topic qos:(MQTTQosLevel)qos retained:(BOOL)retained mid:(unsigned int)mid{
    NSLog(@"获取消息2:%@",topic);
}

@end
