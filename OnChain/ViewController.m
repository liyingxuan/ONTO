//
//  ViewController.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/1/31.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "ViewController.h"
#import "IdentityViewController.h"
#import "MineViewController.h"
#import "HomeViewController.h"
#import "CapitalViewController.h"

//#import <MiniVisionAuthorization/MiniVisionAuthorization.h>

@interface ViewController () ///<>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


+ (void)gotoGuideVC {
    
}

+ (void)gotoHomeVC {
    HomeViewController *vc = [[HomeViewController alloc] init];
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    APP_DELEGATE.window.rootViewController = nav;
    
}

+ (void)gotoIdentityVC {
    IdentityViewController *identityVC = [[IdentityViewController alloc] init];
    BaseNavigationViewController* identityNav = [[BaseNavigationViewController alloc] initWithRootViewController:identityVC];
    
    CapitalViewController *capitalVC = [[CapitalViewController alloc] init];
    BaseNavigationViewController *capitalNav = [[BaseNavigationViewController alloc] initWithRootViewController:capitalVC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    BaseNavigationViewController *mineNav = [[BaseNavigationViewController alloc] initWithRootViewController:mineVC];
    
    UITabBarController *controlTab = [[UITabBarController alloc] init];
    controlTab.viewControllers = [NSArray arrayWithObjects:identityNav,capitalNav,mineNav,nil];
    [BaseViewController setTabbarItemWithItemTitle:TABONETITLE ItemTitleColor:TABONECOLOR ItemTitleColorSelected:TABONECOLORSELECTED ItemTitleFont:K12FONT ItemImage:TABONEIMAGE ItemImageSelected:TABONEIMAGESELECTED AtIndex:0 SourceTabbar:controlTab];
    [BaseViewController setTabbarItemWithItemTitle:TABTWOTITLE ItemTitleColor:TABTWOCOLOR ItemTitleColorSelected:TABTWOCOLORSELECTED ItemTitleFont:K12FONT ItemImage:TABTWOIMAGE ItemImageSelected:TABTWOIMAGESELECTED AtIndex:1 SourceTabbar:controlTab];
    [BaseViewController setTabbarItemWithItemTitle:TABTHREETITLE ItemTitleColor:TABTHREECOLOR ItemTitleColorSelected:TABTHREECOLORSELECTED ItemTitleFont:K12FONT ItemImage:TABTHREEIMAGE ItemImageSelected:TABTHREEIMAGESELECTED AtIndex:2 SourceTabbar:controlTab];
    APP_DELEGATE.window.rootViewController = controlTab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
