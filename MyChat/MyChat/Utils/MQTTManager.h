//
//  MQTTManager.h
//  MyChat
//
//  Created by simple on 2018/4/12.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MQTTManager : NSObject
@property (strong, nonatomic) MQTTSession *session;
@property (nonatomic, copy) void (^block)(void);

- (void)loginWithUserName:(NSString*)userName withPassword:(NSString*)password;
- (void)disconnect;
- (void)sendMessage:(NSDictionary*)message to:(NSString*)userAccount;
- (void)sendMessage:(Message*)message;

+ (instancetype)share;
@end
