//
//  WebIdentityViewController.m
//  OnChain
//
//  Created by 赵伟 on 2018/3/8.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "WebIdentityViewController.h"
#import <WebKit/WebKit.h>

@interface WebIdentityViewController ()<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

{
    WKWebView *webView;
}
@end

@implementation WebIdentityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configNav];
    [self configUI];
 
}

- (void)configNav {
//    [self setNavTitle:Localized(@"LoginCreateCount")];
    [self setNavLeftImageIcon:[UIImage imageNamed:@"nav_back"] Title:Localized(@"Back")];
}

- (void)navLeftAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configUI {
    
    webView = [[WKWebView alloc]init];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    
    NSString *typeStr = @"";

    switch (_identityType) {
        case 0:
            typeStr = @"twitter_authentication";
             [self setNavTitle:Localized(@"TwitterClaim")];
            break;
        case 1:
            typeStr = @"linkedin_authentication";
             [self setNavTitle:Localized(@"LinkedinClaim")];
            break;
        case 2:
            typeStr = @"github_authentication";
            [self setNavTitle:Localized(@"GithubClaim")];
            break;
        case 3:
            typeStr = @"facebook_authentication";
            [self setNavTitle:Localized(@"FacebookClaim")];
            break;
        default:
            break;
    }
    
    NSString *urlStr = [NSString stringWithFormat:@"http://42.159.233.39:8000?context=claim:%@&ontid=6469643a6f6e743a5452616a31684377615135336264525450635a78596950415a364d61376a6351564b&encryptedPrivateKey=6PYRC4fgNSq7uVC7dUCLbb9GpjnTcFwLqDMQ2zAAX7NNqH47tfirgsNEQw&deviceCode=device38b7902a0c624b42a42ade31b1ad7779&lang=zh_hans",typeStr];
    NSLog(@"urlStr !!%@",urlStr);
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
}

#pragma mark WKWebViewDelegate
/**
 webview加载完成
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"js finish！！！");
//    _callbackJSFinish();
      [MBProgressHUD hideHUDForView:self.view animated:YES];
}

/**
 webview开始加载
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"js start！！！");
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

/**
 webview加载失败
 */
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"js error！！！");
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

/**
 webview拦截alert
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    NSLog(@"alert%@",message);
    completionHandler();
}

/**
 webview拦截Confirm
 */
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"confirm%@",message);
    completionHandler(YES);
}

/**
 webview拦截Prompt
 */
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
     [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"prompt===%@",prompt);
    [self savePrompt:prompt];
    completionHandler(@"123");
}

/**
 webview拦截js方法
 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"message:%@",message);
}

#pragma mark handlePrompt
- (void)savePrompt:(NSString *)prompt {
    
//    if ([prompt hasPrefix:@"Ont://"]) {
//        prompt = [prompt substringFromIndex:6];
//        _callbackPrompt(prompt);
//    }
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
