//
//  BackView.h
//  OnChain
//
//  Created by 张超 on 2018/3/2.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackView : UIView

@property (nonatomic, copy) void (^callbackBack)(void);

@end
