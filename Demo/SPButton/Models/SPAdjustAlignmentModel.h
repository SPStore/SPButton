//
//  SPAdjustAlignmentModel.h
//  SPButton
//
//  Created by 乐升平 on 2018/11/30.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPAdjustAlignmentModel : NSObject
@property (nonatomic, assign) NSInteger h_selectedSegmentIndex; // 调整水平对齐的segmentedControl选中的下标
@property (nonatomic, assign) NSInteger v_selectedSegmentIndex; // 调整垂直对齐的segmentedControl选中的下标
@end

NS_ASSUME_NONNULL_END
