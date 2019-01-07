//
//  WebToolBar.h
//  webUI
//
//  Created by careyang on 2019/1/7.
//  Copyright © 2019 careyang. All rights reserved.
//

#import <UIKit/UIKit.h>
// 只支持样式统一，不支持分散的
typedef NS_ENUM(NSInteger , ItemType) {
    ItemTypeIcon = 0 ,
    ItemTypeText ,
};
NS_ASSUME_NONNULL_BEGIN

@protocol WebToolDelegate <NSObject>

@required
-(NSArray *) webToolItems;
@optional
-(void) WebToolClickWithIndex:(NSInteger) clickIndex;

@end


@interface WebToolBar : UIToolbar

@property (nonatomic , strong) id<WebToolDelegate> webDelegate;

-(WebToolBar *) initWithFrame:(CGRect) frame type:(ItemType) type;
-(void) configToolBarUI;
@end

NS_ASSUME_NONNULL_END
