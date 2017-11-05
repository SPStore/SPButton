//
//  SPButton.h
//  SPButton
//
//  Created by leshengping on 16/10/28.
//  Copyright © 2016年 leshengping. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SPButtonImagePosition) {
    SPButtonImagePositionDefault,   // 默认在左边
    SPButtonImagePositionLeft,      // 图片在左边
    SPButtonImagePositionTop,       // 图片在上面
    SPButtonImagePositionRight,     // 图片在右边
    SPButtonImagePositionBottom     // 图片在下面
};

@interface SPButton : UIButton

- (instancetype)initWithImageRatio:(CGFloat)ratio;

// 图片的高度所占按钮的高度比例,注意要浮点数，如果传分数比如三分之二，要写2.0/3.0，不能写2/3
@property (nonatomic, assign) CGFloat imageRatio;

@property (nonatomic, assign) SPButtonImagePosition imagePosition;

@end
