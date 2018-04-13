//
//  Global.h
//  AtChat
//
//  Created by zhouMR on 16/11/3.
//  Copyright © 2016年 luowei. All rights reserved.
//

#ifndef Global_h
#define Global_h


#define DEVICEWIDTH [UIScreen mainScreen].bounds.size.width
#define DEVICEHEIGHT [UIScreen mainScreen].bounds.size.height
#define RATIO_WIDHT320 [UIScreen mainScreen].bounds.size.width/320.0
#define RATIO_WIDHT750 [UIScreen mainScreen].bounds.size.width/375.0

#define NAV_STATUS_HEIGHT 64
#define TABBAR_HEIGHT 49

//颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1)
#define RGB3(v) RGB(v,v,v)

#define randomColor RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define APP_COLOR RGB(230,0,18)
#define APP_Gray_COLOR RGB3(201)
#define APP_BLACK_COLOR RGB3(51)


#pragma mark --------- 字体大小
#define FONT(size) [UIFont systemFontOfSize:size]


#endif /* Global_h */
