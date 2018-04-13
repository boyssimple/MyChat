//
//  CellMessage.m
//  MyChat
//
//  Created by simple on 2018/4/12.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "CellMessage.h"

@interface CellMessage()
@property (nonatomic, strong) UIImageView *ivAvatar;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UILabel *lbMsg;
@property (nonatomic, strong) UILabel *lbTime;
@property (nonatomic, strong) UIView *vLine;
@end

@implementation CellMessage

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _ivAvatar = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivAvatar.userInteractionEnabled = YES;
        _ivAvatar.layer.cornerRadius = 3.f;
        _ivAvatar.layer.masksToBounds = YES;
        [self.contentView addSubview:_ivAvatar];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbName.font = [UIFont systemFontOfSize:14*RATIO_WIDHT320];
        _lbName.textColor = APP_BLACK_COLOR;
        [self.contentView addSubview:_lbName];
        
        _lbMsg = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbMsg.font = [UIFont systemFontOfSize:12*RATIO_WIDHT320];
        _lbMsg.textColor = APP_Gray_COLOR;
        [self.contentView addSubview:_lbMsg];
        
        _lbTime = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbTime.font = [UIFont systemFontOfSize:10*RATIO_WIDHT320];
        _lbTime.textColor = APP_Gray_COLOR;
        [self.contentView addSubview:_lbTime];
        
        _vLine = [[UIView alloc]initWithFrame:CGRectZero];
        _vLine.backgroundColor = RGB3(247);
        [self.contentView addSubview:_vLine];
        
    }
    return self;
}

- (void)updateData{
}

- (void)updateData:(Message*)msg{
    [self.ivAvatar pt_setImage:@"http://scimg.158pic.com/allimg/160420/14-1604201A3431F.jpg"];
    self.lbName.text = msg.fromUserNick;
    self.lbTime.text = msg.time;
    self.lbMsg.text = msg.msg;
}

- (void)updateData:(NSString *)userName with:(NSString*)msg withTime:(NSString*)time{
    self.lbName.text = userName;
    self.lbMsg.text = msg;
    self.lbTime.text = @"上午6:21";
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect r = self.ivAvatar.frame;
    r.size.width = 40*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = 10*RATIO_WIDHT320;
    r.origin.y = (self.height - r.size.height)/2.0;
    self.ivAvatar.frame = r;
    
    CGSize size = [self.lbTime sizeThatFits:CGSizeMake(50*RATIO_WIDHT320, MAXFLOAT)];
    r = self.lbTime.frame;
    r.size.width = 50*RATIO_WIDHT320;
    r.size.height = size.height;
    r.origin.x = DEVICEWIDTH - 50*RATIO_WIDHT320;
    r.origin.y = 0;
    self.lbTime.frame = r;
    
    size = [self.lbName sizeThatFits:CGSizeMake(self.lbTime.left - self.ivAvatar.right - 5*RATIO_WIDHT320, MAXFLOAT)];
    r = self.lbName.frame;
    r.size.width = self.lbTime.left - self.ivAvatar.right - 5*RATIO_WIDHT320;
    r.size.height = size.height;
    r.origin.x = self.ivAvatar.right + 5*RATIO_WIDHT320;
    r.origin.y = 0;
    self.lbName.frame = r;
    
    size = [self.lbMsg sizeThatFits:CGSizeMake(DEVICEWIDTH - self.ivAvatar.right - 10*RATIO_WIDHT320, MAXFLOAT)];
    r = self.lbMsg.frame;
    r.size.width = DEVICEWIDTH - self.ivAvatar.right - 10*RATIO_WIDHT320;
    r.size.height = size.height;
    r.origin.x = self.ivAvatar.right + 5*RATIO_WIDHT320;
    r.origin.y = self.lbName.bottom + 5*RATIO_WIDHT320;
    self.lbMsg.frame = r;
    
    self.lbName.top =self.ivAvatar.top + (self.ivAvatar.height - (self.lbName.height + self.lbMsg.height + 5*RATIO_WIDHT320))/2.0;
    self.lbMsg.top = self.lbName.bottom + 5*RATIO_WIDHT320;
    self.lbTime.top =self.lbName.top + (self.lbName.height - self.lbTime.height)/2.0;
    
    r = self.vLine.frame;
    r.size.width = DEVICEWIDTH - 5*RATIO_WIDHT320;
    r.size.height = 0.5;
    r.origin.x = 5*RATIO_WIDHT320;
    r.origin.y = self.height - 0.5;
    self.vLine.frame = r;
}

+ (CGFloat)calHeight{
    return 60*RATIO_WIDHT320 + 0.5;
}
@end
