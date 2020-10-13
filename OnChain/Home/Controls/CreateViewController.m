//
//  CreateViewController.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/2/7.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "CreateViewController.h"
#import "PwdEnterView.h"
#import "OTAlertView.h"
#import "CreatePwdViewController.h"

typedef NS_ENUM(NSInteger, PWDType) {
    PWDTypeDefault,
    PWDTypeNext,
};

@interface CreateViewController ()

@property (nonatomic, strong) PwdEnterView *pwdView;
@property (nonatomic, strong) UITextField *nameF;
@property (nonatomic, strong) UILabel *pwdL;
@property (nonatomic, strong) UIButton *checkBox;
@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, assign) PWDType type;
@property (nonatomic, copy) NSString *pwdString;
@property (nonatomic, copy) NSString *tempString;

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self configNav];
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)configNav {
    [self setNavTitle:Localized(@"LoginCreateCount")];
    [self setNavLeftImageIcon:[UIImage imageNamed:@"nav_back"] Title:Localized(@"Back")];
}

- (void)configUI {
    
    //    UILabel *nameL = [[UILabel alloc] init];
    //    nameL.font = [UIFont boldSystemFontOfSize:11];
    //    nameL.textColor = NAVTITLECOLOR;
    //    nameL.text = Localized(@"LoginEnterName");
    //    [self.view addSubview:nameL];
    
    self.nameF = [[UITextField alloc] init];
    self.nameF.borderStyle = UITextBorderStyleNone;
    self.nameF.backgroundColor = [UIColor whiteColor];
    self.nameF.font = K14FONT;
    self.nameF.placeholder = Localized(@"EnterIdentity");
    [Common setTextFieldLeftPadding:self.nameF width:10];
    [self.view addSubview:self.nameF];
    
    [self.nameF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(132);
        make.centerX.equalTo(self.view);
        //        make.bottom.equalTo(nameL.mas_bottom).offset(48);
        make.size.mas_equalTo(CGSizeMake((kScreenWidth - 56), 40));
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"d0d0d0"];
    [self.view addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.nameF);
        make.height.mas_equalTo(@1);
    }];
    
    self.checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkBox.selected = YES;
    [self.checkBox addTarget:self action:@selector(checkBoxAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.checkBox setImage:[UIImage imageNamed:@"login_checkbox"] forState:UIControlStateNormal];
    [self.checkBox setImage:[UIImage imageNamed:@"login_checked"] forState:UIControlStateSelected];
    [self.view addSubview:self.checkBox];
    
    [self.checkBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(16, 16));
        make.left.equalTo(self.view).offset(30);
        make.top.mas_equalTo(self.nameF.mas_bottom).offset(65);
    }];
    
    UILabel *checkL = [[UILabel alloc] init];
    checkL.numberOfLines = 0;
    checkL.font = K12FONT;
    checkL.textColor = [UIColor colorWithHexString:@"#5e5e5e"];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:Localized(@"LoginService")];
    [str addAttribute:NSForegroundColorAttributeName value:MAINAPPCOLOR range:NSMakeRange(str.length - 16, 16)];
    checkL.attributedText = str;
    [self.view addSubview:checkL];
    
    [checkL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.checkBox);
        make.top.equalTo(self.nameF.mas_bottom).offset(58);
        make.left.equalTo(self.checkBox.mas_right).offset(17);
        make.right.equalTo(self.view).offset(-40);
    }];
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn setTitle:Localized(@"Next") forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    self.nextBtn.titleLabel.font = K17BFONT;
    self.nextBtn.backgroundColor = [UIColor colorWithHexString:@"#2295d4"];
    [self.nextBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextBtn];
    self.nextBtn.layer.cornerRadius = 16;
    self.nextBtn.layer.masksToBounds = YES;
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.height.mas_equalTo(@37);
        make.top.equalTo(checkL.mas_bottom).offset(92);
    }];
}

- (void)checkBoxAction:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.nextBtn.backgroundColor = [UIColor colorWithHexString:@"#2295d4"];
        self.nextBtn.userInteractionEnabled = YES;
    } else {
        self.nextBtn.backgroundColor = [UIColor colorWithHexString:@"#aaaaaa"];
        self.nextBtn.userInteractionEnabled = NO;
    }

}

- (void)nextAction {
    
    if (self.nameF.text.length <= 0 || self.nameF.text.length > 12) {
    
        OTAlertView *alert = [[OTAlertView alloc] initWithTitle:Localized(@"SelectAlert")];
        [alert showAlert];
    } else {
        if (self.checkBox.selected) {
            CreatePwdViewController *VC = [[CreatePwdViewController alloc] init];
            VC.label = self.nameF.text;
            VC.showRetype = YES;
            [self.navigationController pushViewController:VC animated:YES];
        } else {
            OTAlertView *alert = [[OTAlertView alloc] initWithTitle:Localized(@"SelectBox")];
            [APP_DELEGATE.window addSubview:alert];
        }
    }
}


#pragma mark baseAction
- (void)navLeftAction {
    if (self.type == PWDTypeNext) {
        self.type = PWDTypeDefault;
        self.pwdString = @"";
        [self.pwdView clearPassword];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
