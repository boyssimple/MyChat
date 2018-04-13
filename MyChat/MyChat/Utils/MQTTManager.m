//
//  MQTTManager.m
//  MyChat
//
//  Created by simple on 2018/4/12.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "MQTTManager.h"
#import "AppDelegate.h"
#import "VCMain.h"

static MQTTManager * _mqtt;

@interface MQTTManager()<MQTTSessionDelegate>

@end

@implementation MQTTManager

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    // 一次函数
    dispatch_once(&onceToken, ^{
        if (_mqtt == nil) {
            _mqtt = [super allocWithZone:zone];
        }
    });
    
    return _mqtt;
}

+ (instancetype)share{
    return  [[self alloc] init];
}

/**
 *  登录
 */
- (void)loginWithUserName:(NSString*)userName withPassword:(NSString*)password{
    MQTTCFSocketTransport *transport = [[MQTTCFSocketTransport alloc] init];
    transport.host = SERVER_ADDRESS;
    transport.port = SERVER_PORT;
    
    self.session = [[MQTTSession alloc] init];
    self.session.transport = transport;
    
    self.session.delegate = self;
    [self.session setUserName:userName];
    [self.session setPassword:password];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 会话链接并设置超时时间
        [_session connectAndWaitTimeout:SERVER_TIMEOUT];
    });
    self.session.connectHandler = ^(NSError *error) {
        NSLog(@"%@",error);
    };
}

/**
 * 断开连接
 */
- (void)disconnect{
    if (self.session) {
        [self.session disconnect];
    }
}

/**
 * 发送消息
 */
- (void)sendMessage:(NSDictionary*)message to:(NSString*)userAccount{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:message options:NSJSONWritingPrettyPrinted error:&error];
    if(!error){
        if (self.session) {
            [self.session publishAndWaitData:data onTopic:[self getSingleTopic:userAccount] retain:NO qos:MQTTQosLevelAtMostOnce];
        }
    }
}

- (void)sendMessage:(Message*)message{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:[message parseToDic] options:NSJSONWritingPrettyPrinted error:&error];
    if(!error){
        if (self.session) {
            [self.session publishAndWaitData:data onTopic:[self getSingleTopic:message.toAccount] retain:NO qos:MQTTQosLevelAtMostOnce];
        }
    }
}

- (NSString *)getSingleTopic:(NSString*)userAccount{
    return [NSString stringWithFormat:@"%@%@",MESSAGE_SINGLE_CHAT,userAccount];
}

- (NSString *)getGroupTopic:(NSString*)userAccount{
    return [NSString stringWithFormat:@"%@%@",MESSAGE_SINGLE_CHAT,userAccount];
}

#pragma mark - MQTTSessionDelegate 代理
- (void)connected:(MQTTSession*)session{
    NSLog(@"连接成功！");
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    VCMain *vc = [[VCMain alloc]init];
    [appDelegate restoreRootViewController:vc];
    //
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 订阅主题, qosLevel是一个枚举值,指的是消息的发布质量
        // 注意:订阅主题不能放到子线程进行,否则block不会回调
        [self.session subscribeToTopic:[self getSingleTopic:[AppUser share].userAccount] atLevel:2 subscribeHandler:^(NSError *error, NSArray<NSNumber *> *gQoss) {
            if (error) {
                NSLog(@"Subscription failed %@", error.localizedDescription);
            } else {
                NSLog(@"Subscription sucessfull! Granted Qos: %@", gQoss);
            }
        }];
    });
    
}

- (void)handleEvent:(MQTTSession*)session event:(MQTTSessionEvent)eventCode error:(NSError*)error{
    NSLog(@"处理连接状态回调");
    switch (eventCode) {
        case MQTTSessionEventConnected:
            NSLog(@"connected");
            break;
        case MQTTSessionEventConnectionRefused:
            NSLog(@"connection refused");
            break;
        case MQTTSessionEventConnectionClosed:
            NSLog(@"connection closed");
            break;
        case MQTTSessionEventConnectionError:
            NSLog(@"connection error");
            NSLog(@"reconnecting...");
            // Forcing reconnection
            break;
        case MQTTSessionEventProtocolError:
            NSLog(@"protocol error");
            break;
    }
}

- (void)newMessage:(MQTTSession *)session data:(NSData *)data onTopic:(NSString *)topic qos:(MQTTQosLevel)qos retained:(BOOL)retained mid:(unsigned int)mid{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    Message *msg = [[Message alloc]init];
    [msg parse:dic];
    
    [self postNotification:MESSAGE_RECEIVE withObject:msg];
    
//    NSString *payloadString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"获取消息:%@-----%@",dic,topic);
    
    
}

@end
