//
//  Config.h
//  OnChain
//
//  Created by Zeus.Zhang on 2018/1/31.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#ifndef Config_h
#define Config_h

#import <YYKit.h>
#import <AFNetworking.h>
#import "AppDelegate.h"
#import "BaseNavigationViewController.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "Common.h"
#import "UIViewController+HUD.h"
#import "UIImage+LXQRCode.h"
#import "OTAlertView.h"

//Nav、Tab颜色字体
#define NAVBACKCOLOR [UIColor colorWithHexString:@"#FFFFFF"]
#define NAVTITLECOLOR [UIColor colorWithHexString:@"#565656"]
#define NAVFONT [UIFont systemFontOfSize:12.0]
#define MAINBACKCOLOR [UIColor colorWithHexString:@"#212121"]
#define TABBARTITLECOLOR [UIColor colorWithHexString:@"#212121"]
#define TABBARTITLECOLORSELECTED [UIColor colorWithHexString:@"#33A4BE"]
#define TABITEMFONT [UIFont systemFontOfSize:10.0]

#define MAINAPPCOLOR [UIColor colorWithHexString:@"#20c0db"]
#define TABLEBACKCOLOR [UIColor colorWithHexString:@"#f4f4f4"]

#define K20FONT [UIFont systemFontOfSize:20]
#define K18FONT [UIFont systemFontOfSize:18]
#define K17FONT [UIFont systemFontOfSize:17]
#define K16FONT [UIFont systemFontOfSize:16]
#define K14FONT [UIFont systemFontOfSize:14]
#define K12FONT [UIFont systemFontOfSize:12]

#define K20BFONT [UIFont boldSystemFontOfSize:20]
#define K18BFONT [UIFont boldSystemFontOfSize:18]
#define K17BFONT [UIFont boldSystemFontOfSize:17]
#define K16BFONT [UIFont boldSystemFontOfSize:16]
#define K14BFONT [UIFont boldSystemFontOfSize:14]
#define K12BFONT [UIFont boldSystemFontOfSize:12]


//Tabbar图片
/** tab one **/
#define TABONEIMAGE [UIImage imageNamed:@"tab_one"]
#define TABONEIMAGESELECTED [UIImage imageNamed:@"tab_one_selected"]
#define TABONETITLE @"ID"
#define TABONECOLOR [UIColor colorWithHexString:@"#FFFFFF"]
#define TABONECOLORSELECTED [UIColor colorWithHexString:@"#20c0db"]
/** tab two **/
#define TABTWOIMAGE [UIImage imageNamed:@"tab_two"]
#define TABTWOIMAGESELECTED [UIImage imageNamed:@"tab_two_selected"]
#define TABTWOTITLE @"Asset"
#define TABTWOCOLOR [UIColor colorWithHexString:@"#FFFFFF"]
#define TABTWOCOLORSELECTED [UIColor colorWithHexString:@"#20c0db"]

/** tab three **/
#define TABTHREEIMAGE [UIImage imageNamed:@"tab_three"]
#define TABTHREEIMAGESELECTED [UIImage imageNamed:@"tab_three_selected"]
#define TABTHREETITLE @"Me"
#define TABTHREECOLOR [UIColor colorWithHexString:@"#FFFFFF"]
#define TABTHREECOLORSELECTED [UIColor colorWithHexString:@"#20c0db"]

#define TABFOURIMAGE [UIImage imageNamed:@"tab_me"]
#define TABFOURIMAGESELECTED [UIImage imageNamed:@"tab_me_selected"]

//国际化
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"userLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"InfoPlist"]

//iPhone X
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//屏幕宽高
#define SYSHeight [UIScreen mainScreen].bounds.size.height
#define SYSWidth  [UIScreen mainScreen].bounds.size.width
#define SCALE_W  ([[UIScreen mainScreen] bounds].size.width/375)

#endif /* Config_h */
