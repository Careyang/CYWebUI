//
//  WebViewController.h
//  webUI
//
//  Created by careyang on 2019/1/7.
//  Copyright © 2019 careyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController
+(WebViewController *) shareInstance;
-(void) loadWebViewWithURl:(NSString *) urlStr;
@end

NS_ASSUME_NONNULL_END
