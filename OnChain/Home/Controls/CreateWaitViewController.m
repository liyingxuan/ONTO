//
//  CreateWaitViewController.m
//  OnChain
//
//  Created by 张超 on 2018/3/2.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "CreateWaitViewController.h"
#import "BrowserView.h"
#import "BackView.h"

@interface CreateWaitViewController ()

@property (nonatomic, strong) BrowserView *browserView;

@end

@implementation CreateWaitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];

}

- (void)configUI {
    
    UIImageView *bgIV = [[UIImageView alloc] init];
    bgIV.image = [UIImage imageNamed:@"wait_bg"];
    [self.view addSubview:bgIV];
    
    [bgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(@(259 * kScreenWidth / 375));
    }];

    BackView *backV = [[BackView alloc] initWithFrame:CGRectZero];
    [backV setCallbackBack:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview:backV];
    
    [backV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(24);
        make.top.equalTo(self.view).offset(35);
        make.height.mas_equalTo(@30);
    }];
    [backV layoutIfNeeded];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.view addSubview:self.browserView];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (BrowserView *)browserView {
    if (!_browserView) {
        _browserView = [[BrowserView alloc] initWithFrame:CGRectZero];
        __weak typeof(self) weakSelf = self;
        [_browserView setCallbackPrompt:^(NSString *prompt) {
            NSLog(@"prompt=%@",prompt);
            [weakSelf handlePrompt:prompt];
        }];
        [_browserView setCallbackJSFinish:^{
            [weakSelf loadJS];
        }];
    }
    return _browserView;
}

- (void)loadJS {
    NSString *jsStr =  [NSString stringWithFormat:@"Ont.SDK.createWallet('%@','%@','getWalletDataStr')",self.label,self.password];
    [self.browserView.wkWebView evaluateJavaScript:jsStr completionHandler:nil];
}

- (void)handlePrompt:(NSString *)prompt {
    if ([prompt hasPrefix:@"getWalletDataStr"]) { //创建身份账户
        NSArray *promptArray = [prompt componentsSeparatedByString:@"params="];
        NSString *resultStr = promptArray[1];
        
        NSString *jsStr = [NSString stringWithFormat:@"Ont.SDK.registerOntid('%@','getOntId')",resultStr];
        [self.browserView.wkWebView evaluateJavaScript:jsStr completionHandler:nil];
        
        //todo saveResult
        id obj = [NSJSONSerialization JSONObjectWithData:[resultStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        NSLog(@"%@",obj);
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSArray *identities = [obj valueForKey:@"identities"];
            NSData *identities_data=[NSJSONSerialization dataWithJSONObject:identities options:NSJSONWritingPrettyPrinted error:nil];
            NSString *identities_json=[[NSString alloc] initWithData:identities_data encoding:NSUTF8StringEncoding];
            
            NSString *encryptedPrivateKey = [[[identities[0] valueForKey:@"controls"] objectAtIndex:0] valueForKey:@"key"];
            NSString *ontid = [identities[0] valueForKey:@"ontid"];
            
            NSString *qrcode_str = [NSString stringWithFormat:@"%@&%@&%@",identities_json,encryptedPrivateKey,ontid];
            NSLog(@"qrcode_str=%@",qrcode_str);
        }
    } else if ([prompt hasPrefix:@"getOntId"]){
        [self hideHud];
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
