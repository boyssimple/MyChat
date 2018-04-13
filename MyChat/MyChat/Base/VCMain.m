//
//  VCMain.m
//  LeftMaster
//
//  Created by simple on 2018/4/2.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "VCMain.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
@interface VCMain ()<UITabBarControllerDelegate>

@end

@implementation VCMain

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.delegate = self;
    [self createContentPages];
}


- (void) createContentPages {
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"VCMessage",
                                   kTitleKey  : @"亲亲",
                                   kImgKey    : @"tab_home_icon_normal",
                                   kSelImgKey : @"tab_home_icon_selected"},
                                 
                                 @{kClassKey  : @"VCContact",
                                   kTitleKey  : @"亲友",
                                   kImgKey    : @"tab_commodity_icon_normal",
                                   kSelImgKey : @"tab_commodity_icon_selected"},
                                 
                                 @{kClassKey  : @"VCDiscovery",
                                   kTitleKey  : @"亲圈",
                                   kImgKey    : @"tab_Shopping-Cart_icon_normal",
                                   kSelImgKey : @"tab_Shopping-Cart_icon_selected"},
                                 
                                 @{kClassKey  : @"VCMe",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"tab_me_icon_selnormal",
                                   kSelImgKey : @"tab_me_icon_selected"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [[UIImage imageNamed:dict[kImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//[UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//[UIImage imageNamed:dict[kSelImgKey]];
        
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : RGB(0, 0, 0)} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : RGB(230, 0, 18)} forState:UIControlStateSelected];
        
        
        [self addChildViewController:nav];
    }];
}


@end
