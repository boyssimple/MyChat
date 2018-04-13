//
//  Message.h
//  MyChat
//
//  Created by simple on 2018/4/13.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, MessageType) {
    MessageTypeChat    = 1 << 0, // 1
    MessageTypeGroup  = 1 << 1, // 2
    MessageTypeSystem = 1 << 2, // 4
    MessageTypeElse  = 1 << 3, // 8
};

@interface Message : NSObject
@property (nonatomic, strong) NSString *fromAccount;        //来自用户帐号
@property (nonatomic, strong) NSString *fromUserNick;       //来自用户昵称
@property (nonatomic, strong) NSString *toAccount;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) MessageType msgType;      //消息类别

- (void)parse:(NSDictionary*)data;
- (NSDictionary*)parseToDic;

@end
