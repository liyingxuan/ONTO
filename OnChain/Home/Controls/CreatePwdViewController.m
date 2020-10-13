//
//  CreatePwdViewController.m
//  OnChain
//
//  Created by 张超 on 2018/3/2.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "CreatePwdViewController.h"
#import "PwdEnterView.h"
#import "CreateWaitViewController.h"

@interface CreatePwdViewController ()

@property (nonatomic, strong) PwdEnterView *pwdView;
@property (nonatomic, copy) NSString *setPwd;
@property (nonatomic, copy) NSString *retypePwd;
@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation CreatePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configNav];
    [self configUI];
}

- (void)configNav {
    [self setNavTitle:Localized(@"LoginCreateCount")];
    [self setNavLeftImageIcon:[UIImage imageNamed:@"nav_back"] Title:Localized(@"Back")];
}

- (void)navLeftAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configUI {
    UIView *topV = [[UIView alloc] init];
    topV.backgroundColor = [UIColor colorWithHexString:@"#2295d4"];
    [self.view addSubview:topV];
    
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
    }];
    
    UILabel *alertL = [[UILabel alloc] init];
    alertL.numberOfLines = 0;
    alertL.font = K12FONT;
    alertL.textColor = [UIColor whiteColor];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:Localized(@"CreateAlert")];
    [str addAttribute:NSFontAttributeName value:K12BFONT range:NSMakeRange(0, 19)];
    alertL.attributedText = str;
    [topV addSubview:alertL];
    
    [alertL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topV).offset(22);
        make.top.equalTo(topV).offset(12);
        make.right.equalTo(topV).offset(-22);
        make.bottom.equalTo(topV).offset(-12);
    }];
    
    UILabel *setL = [[UILabel alloc] init];
    setL.font = K14BFONT;
    setL.textColor = [UIColor colorWithHexString:@"#565656"];
    setL.text = Localized(@"LoginSetPassword"); //LoginRetypePassword
    [self.view addSubview:setL];
    
    [setL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(29);
        make.top.equalTo(topV.mas_bottom).offset(30);
    }];
    __weak typeof(self) weakself = self;
    PwdEnterView *setV = [[PwdEnterView alloc] initWithFrame:CGRectZero];
    [setV setCallbackPwd:^(NSString *pwd_text) {
        weakself.setPwd = pwd_text;
    }];
    [self.view addSubview:setV];
    
    [setV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(setL.mas_bottom).offset(50);
        make.height.mas_equalTo(@40);
        make.left.equalTo(self.view).offset(28);
        make.right.equalTo(self.view).offset(-28);
    }];
    [setV layoutIfNeeded];
    
    UILabel *retypeL = [[UILabel alloc] init];
    retypeL.font = K14BFONT;
    retypeL.textColor = [UIColor colorWithHexString:@"#565656"];
    retypeL.text = Localized(@"LoginRetypePassword"); //LoginRetypePassword
    [self.view addSubview:retypeL];
    retypeL.hidden = !_showRetype;
    
    [retypeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(setL);
        make.top.equalTo(setV.mas_bottom).offset(41);
    }];
    
    PwdEnterView *retypeV = [[PwdEnterView alloc] initWithFrame:CGRectZero];
    [retypeV setCallbackPwd:^(NSString *pwd_text) {
        weakself.retypePwd = pwd_text;
    }];
    [self.view addSubview:retypeV];
    
    [retypeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(retypeL.mas_bottom).offset(50);
        make.height.mas_equalTo(@40);
        make.left.equalTo(self.view).offset(28);
        make.right.equalTo(self.view).offset(-28);
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
        make.top.equalTo(retypeV.mas_bottom).offset(62);
    }];
    
}

- (void)nextAction {
    if ([self.setPwd isEqualToString:self.retypePwd]) {
//        [self showHudInView:self.view hint:Localized(@"Waiting...")];
        CreateWaitViewController *VC = [[CreateWaitViewController alloc] init];
        VC.label = self.label;
        VC.password = self.setPwd;
        [self.navigationController pushViewController:VC animated:YES];
    } else {
        OTAlertView *alert = [[OTAlertView alloc] initWithTitle:Localized(@"PWDERROR")];
        [alert showAlert];
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
