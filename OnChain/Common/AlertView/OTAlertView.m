//
//  OTAlertView.m
//  OnChain
//
//  Created by 张超 on 2018/3/2.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "OTAlertView.h"
#import "Config.h"

@implementation OTAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithTitle:(NSString *)alertStr {
    if (self == [super initWithFrame:[UIScreen mainScreen].bounds]) {
        _alertStr = alertStr;
        [self configUI];
        [self configTouch];
    }
    return self;
}

- (void)configUI {
    self.backgroundColor = [UIColor colorWithHexString:@"#aaaaaa80"];
    
    UIView *alertV = [[UIView alloc] init];
    alertV.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    [self addSubview:alertV];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    
    UILabel *alertL = [[UILabel alloc] init];
    alertL.numberOfLines = 0;
    alertL.text = self.alertStr;
    alertL.font = K14BFONT;
    alertL.textColor = [UIColor colorWithHexString:@"#20c0db"];
    alertL.textAlignment = NSTextAlignmentCenter;
    [self addSubview:alertL];
    
    [alertV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(42);
        make.right.equalTo(self).offset(-42);
        make.centerY.mas_equalTo(self);
    }];
    
    [alertL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(alertV).offset(20);
        make.right.equalTo(alertV).offset(-20);
        make.top.equalTo(alertV).offset(49);
        make.bottom.equalTo(alertV).offset(-49);
    }];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 10));
        make.top.equalTo(alertV).offset(13);
        make.right.equalTo(alertV).offset(-13);
    }];
}

- (void)configTouch {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        [self removeFromSuperview];
    }];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:singleTap];
}

- (void)closeAction {
    [self removeFromSuperview];
}

- (void)showAlert {
    [APP_DELEGATE.window addSubview:self];
}

@end
