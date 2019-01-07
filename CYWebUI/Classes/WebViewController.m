//
//  WebViewController.m
//  webUI
//
//  Created by careyang on 2019/1/7.
//  Copyright © 2019 careyang. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "WebToolBar.h"

#define WebSCREEN_SIZE UIScreen.mainScreen.bounds.size

@interface WebViewController ()<WKNavigationDelegate , WebToolDelegate>
@property (nonatomic , strong) WKWebView * webview;
@property (nonatomic , strong) WebToolBar * toolBar;
@property (nonatomic , strong) NSArray * itemList;
@property (nonatomic , strong) NSString * homeUrl;
@end

@implementation WebViewController

+(WebViewController *) shareInstance
{
    WebViewController * web = [[WebViewController alloc] init];
    return web;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * urlStr = @"http://www.sina.com";

    [self loadWebViewWithURl:urlStr];
}

-(void) loadWebViewWithURl:(NSString *) urlStr
{
    if (self.homeUrl == nil) {
        self.homeUrl = urlStr;
    }

    NSURL * url = [NSURL URLWithString:urlStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];

    [self.toolBar configToolBarUI];
}

#pragma mark toolbar 的代理方法
-(NSArray *) webToolItems
{
    return self.itemList;
}
-(void) WebToolClickWithIndex:(NSInteger)clickIndex
{
    NSString * string = self.itemList[clickIndex];
    NSLog(@"click item = %@" , string);
    switch (clickIndex) {
        case 0:
            {
                if ([self.webview canGoBack]) {
                    [self.webview goBack];
                }
            }
            break;
        case 1:
        {
            if ([self.webview canGoForward]) {
                [self.webview goForward];
            }
        }
            break;
        case 2:
        {
            [self.webview reload];
        }
            break;
        case 3:
        {
            if (self.homeUrl) {
                [self loadWebViewWithURl:self.homeUrl];
            }
        }
            break;

        default:
            break;
    }
}
#pragma mark lazy init
-(WKWebView *) webview
{
    if (!_webview) {
        WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc] init];
        if ([self isPhoneXModel]) {
            _webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, WebSCREEN_SIZE.width, WebSCREEN_SIZE.height - 44 - 34) configuration:config];
        }else{
            _webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, WebSCREEN_SIZE.width, WebSCREEN_SIZE.height - 44) configuration:config];
        }
        _webview.navigationDelegate = self;
        [self.view addSubview:_webview];
    }
    return _webview;
}
-(WebToolBar *) toolBar
{
    if (!_toolBar) {
        _toolBar = [[WebToolBar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.webview.frame), WebSCREEN_SIZE.width, 44) type:ItemTypeIcon];
        _toolBar.webDelegate = self;
        [self.view addSubview:_toolBar];
    }
    return _toolBar;
}
-(NSArray *) itemList
{
    if (!_itemList) {
//        _itemList = [NSArray arrayWithObjects:@"后退",@"前进",@"刷新",@"主页", nil];
        _itemList = [NSArray arrayWithObjects:@"back@2x",@"forward@2x",@"refresh@2x",@"home@2x", nil];
    }
    return _itemList;
}
/*
 机型            分辨率      逻辑分辨率
 iPhone X/XS    1125x2436  375x812
 iPhone XR      828x1792   414x896
 iPhone XS Max  1242x2688  414x896
 */
-(BOOL) isPhoneXModel
{
    UIScreen * mainScreen = UIScreen.mainScreen;
    CGFloat height = MAX(mainScreen.bounds.size.width, mainScreen.bounds.size.height);
    if (height == 812 || height == 896) {
        return YES;
    }
    return NO;
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
