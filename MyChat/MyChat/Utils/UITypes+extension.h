//
//  UITypes+extension.h
//  MyChat
//
//  Created by simple on 2018/4/13.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (extension)
+ (UIImage*)stretchImage:(NSString*)name;
+ (UIImage*)stretchAllImage:(NSString*)name;
@end

@interface NSString (extension)
- (NSString*)trim;
@end

@interface UIView (extension)
- (void)updateData;
+ (CGFloat)calHeight;
-(UINavigationController *) navigationController;
@end

@interface UIImageView (extension)
- (void)pt_setImage:(NSString*)url;
@end

@interface UITableViewCell (extension)
@end


