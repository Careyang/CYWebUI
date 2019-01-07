//
//  WebToolBar.m
//  webUI
//
//  Created by careyang on 2019/1/7.
//  Copyright © 2019 careyang. All rights reserved.
//

#import "WebToolBar.h"

@interface WebToolBar ()
@property (nonatomic , assign) ItemType type;
@property (nonatomic , strong) NSArray * itemArr;
@end

@implementation WebToolBar

-(WebToolBar *) initWithFrame:(CGRect) frame type:(ItemType) type
{
    WebToolBar * toolbar = [[WebToolBar alloc] initWithFrame:frame];
    toolbar.type = type;
    return toolbar;
}


-(void) configToolBarUI
{
    if (self.webDelegate && [self.webDelegate respondsToSelector:@selector(webToolItems)]){
        self.itemArr = [self.webDelegate webToolItems];
    }else{
        NSAssert(self.webDelegate == nil, @"代理数据未实现");
    }
    //初始化界面
    NSMutableArray * arr = [NSMutableArray array];
    for (NSInteger index = 0 ; index < self.itemArr.count ; index++)
    {
        NSString * title = self.itemArr[index];
        if (self.type == ItemTypeText) {
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
            item.tag = index;
            [arr addObject:item];
        }else{
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:title] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
            item.tag = index;
            [arr addObject:item];
        }
        if (index < self.itemArr.count - 1) {
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            [arr addObject:item];
        }
    }
    self.items = arr;
}

-(void) itemClick:(UIBarButtonItem *) barButtonItem
{
    if (self.webDelegate && [self.webDelegate respondsToSelector:@selector(WebToolClickWithIndex:)]) {
        [self.webDelegate WebToolClickWithIndex:barButtonItem.tag];
    }
}
#pragma mark lazy init
-(NSArray *) itemArr
{
    if (!_itemArr) {
        _itemArr = [NSArray array];
    }
    return _itemArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
