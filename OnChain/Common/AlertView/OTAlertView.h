//
//  OTAlertView.h
//  OnChain
//
//  Created by 张超 on 2018/3/2.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTAlertView : UIView

@property (nonatomic, copy) NSString *alertStr;

- (id)initWithTitle:(NSString *)alertStr;

- (void) showAlert;

@end
