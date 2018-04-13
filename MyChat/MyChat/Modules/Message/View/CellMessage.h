//
//  CellMessage.h
//  MyChat
//
//  Created by simple on 2018/4/12.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellMessage : UITableViewCell
- (void)updateData:(NSString *)userName with:(NSString*)msg withTime:(NSString*)time;
- (void)updateData:(Message*)msg;
@end
