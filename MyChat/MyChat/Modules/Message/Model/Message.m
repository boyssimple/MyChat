//
//  Message.m
//  MyChat
//
//  Created by simple on 2018/4/13.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "Message.h"

@implementation Message

- (void)parse:(NSDictionary*)data{
    self.fromAccount = [data jk_stringForKey:@"fromAccount"];
    self.fromUserNick = [data jk_stringForKey:@"fromUserNick"];
    self.toAccount = [data jk_stringForKey:@"toAccount"];
    self.time = [data jk_stringForKey:@"time"];
    self.msg = [data jk_stringForKey:@"msg"];
    self.msgType = [data jk_integerForKey:@"msgType"];
}

- (NSDictionary*)parseToDic{
    NSMutableDictionary*data = [[NSMutableDictionary alloc]init];
    [data setObject:self.fromAccount forKey:@"fromAccount"];
    [data setObject:self.fromUserNick forKey:@"fromUserNick"];
    [data setObject:self.toAccount forKey:@"toAccount"];
    [data setObject:self.time forKey:@"time"];
    [data setObject:self.msg forKey:@"msg"];
    [data setObject:@(self.msgType) forKey:@"msgType"];
    return data;
}
@end
