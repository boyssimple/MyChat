//
//  AppUser.h
//  MyChat
//
//  Created by simple on 2018/4/13.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUser : NSObject
@property (nonatomic, strong) NSString *userAccount;
@property (nonatomic, strong) NSString *userPassword;
+ (instancetype)share;
@end
