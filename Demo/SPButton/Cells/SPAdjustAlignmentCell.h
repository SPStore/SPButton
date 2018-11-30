//
//  SPAdjustImagePositionCell.h
//  SPButton
//
//  Created by 乐升平 on 2018/11/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SPAdjustAlignmentCell,SPAdjustAlignmentModel;
@protocol SPAdjustAlignmentCellDelegate <NSObject>
@optional;
// h_表示水平，v_表示垂直

- (void)cell:(SPAdjustAlignmentCell *)cell h_selectedCenter:(UISegmentedControl *)segmentedControl; // 水平居中
- (void)cell:(SPAdjustAlignmentCell *)cell h_selectedLeft:(UISegmentedControl *)segmentedControl; // 水平居左
- (void)cell:(SPAdjustAlignmentCell *)cell h_selectedRight:(UISegmentedControl *)segmentedControl; // 水平居右
- (void)cell:(SPAdjustAlignmentCell *)cell h_selectedFill:(UISegmentedControl *)segmentedControl;// 水平填充

- (void)cell:(SPAdjustAlignmentCell *)cell v_selectedCenter:(UISegmentedControl *)segmentedControl; // 垂直居中
- (void)cell:(SPAdjustAlignmentCell *)cell v_selectedTop:(UISegmentedControl *)segmentedControl; // 垂直居上
- (void)cell:(SPAdjustAlignmentCell *)cell v_selectedBottom:(UISegmentedControl *)segmentedControl; // 垂直居下
- (void)cell:(SPAdjustAlignmentCell *)cell v_selectedFill:(UISegmentedControl *)segmentedControl;// 垂直填充

- (void)cell:(SPAdjustAlignmentCell *)cell sizeToFitButtonClicked:(UIButton *)sender;// sizeToFit按钮被点击
- (void)cell:(SPAdjustAlignmentCell *)cell cancelSizeToFitButtonClicked:(UIButton *)sender;// 取消sizeToFit按钮被点击

@end

@interface SPAdjustAlignmentCell : UITableViewCell
@property (nonatomic, weak) id<SPAdjustAlignmentCellDelegate> delegate;
@property (nonatomic, assign) SPAdjustAlignmentModel *model;
@end

NS_ASSUME_NONNULL_END
