//
//  AppUser.m
//  MyChat
//
//  Created by simple on 2018/4/13.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "AppUser.h"

static AppUser * _user;

@interface AppUser()

@end

@implementation AppUser

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    // 一次函数
    dispatch_once(&onceToken, ^{
        if (_user == nil) {
            _user = [super allocWithZone:zone];
        }
    });
    
    return _user;
}

+ (instancetype)share{
    return  [[self alloc] init];
}

@end
