//
//  SPSetupInsetsCell.h
//  SPButton
//
//  Created by 乐升平 on 2018/11/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SPSetupInsetsCell,SPInsetsModel;
@protocol SPSetupInsetsCellDelegate <NSObject>
@optional;
- (void)cell:(SPSetupInsetsCell *)cell topStepperValueChanged:(SPInsetsModel *)model;     // 上
- (void)cell:(SPSetupInsetsCell *)cell leftStepperValueChanged:(SPInsetsModel *)model;    // 左
- (void)cell:(SPSetupInsetsCell *)cell bottomStepperValueChanged:(SPInsetsModel *)model;  // 下
- (void)cell:(SPSetupInsetsCell *)cell rightStepperValueChanged:(SPInsetsModel *)model;   // 右

@end
@interface SPSetupInsetsCell : UITableViewCell
@property (nonatomic, strong) SPInsetsModel *model;

@property (nonatomic, weak) id<SPSetupInsetsCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
