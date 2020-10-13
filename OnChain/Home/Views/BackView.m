//
//  BackView.m
//  OnChain
//
//  Created by 张超 on 2018/3/2.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "BackView.h"
#import "Config.h"

@implementation BackView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self configUI];
        [self configTap];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)configUI {
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"nav_back"];
    imageV.userInteractionEnabled = YES;
    [self addSubview:imageV];
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(13, 17));
        make.centerY.left.mas_equalTo(self);
    }];
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.font = K12BFONT;
    titleL.textColor = [UIColor whiteColor];
    titleL.userInteractionEnabled = YES;
//    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.text = Localized(@"Back");
    [self addSubview:titleL];
    
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.mas_equalTo(self);
        make.left.equalTo(imageV.mas_right).offset(8);
    }];
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    [super layoutSubviews];
}

- (void)configTap {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        _callbackBack();
    }];
    [self addGestureRecognizer:tap];
}

@end
