//
//  SPInsetsModel.h
//  SPButton
//
//  Created by 乐升平 on 2018/11/29.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SPInsetsType) {
    SPInsetsTypeContent,
    SPInsetsTypeImage,
    SPInsetsTypeTitle
};

@interface SPInsetsModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) double topValue;
@property (nonatomic, assign) double leftValue;
@property (nonatomic, assign) double bottomValue;
@property (nonatomic, assign) double rightValue;
@property (nonatomic, assign) SPInsetsType insetsType;

@end

NS_ASSUME_NONNULL_END
