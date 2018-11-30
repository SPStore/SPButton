//
//  SPSliderCell.h
//  SPButton
//
//  Created by 乐升平 on 2018/11/29.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SPSliderModel,SPSliderCell;

@protocol SPSliderCellDelegate <NSObject>
@optional;
- (void)cell:(SPSliderCell *)cell sliderValueChanged:(SPSliderModel *)model;

@end

@interface SPSliderCell : UITableViewCell
@property (nonatomic, strong) SPSliderModel *model;
@property (nonatomic, weak) id<SPSliderCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
