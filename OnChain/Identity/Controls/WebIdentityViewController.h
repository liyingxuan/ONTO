//
//  WebIdentityViewController.h
//  OnChain
//
//  Created by 赵伟 on 2018/3/8.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "BaseViewController.h"
typedef enum {
    
    TwitterType = 0,
    LinkedinType = 1,
    GithubType = 2,
    FacebookType = 3
    
} IdentityType;
@interface WebIdentityViewController : BaseViewController
@property (nonatomic, assign) IdentityType identityType; // 类型

@end
