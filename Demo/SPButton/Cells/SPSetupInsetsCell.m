//
//  SPSetupInsetsCell.m
//  SPButton
//
//  Created by 乐升平 on 2018/11/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "SPSetupInsetsCell.h"
#import "SPInsetsModel.h"

#define kRealValue(with) ((with)*(kScreenWidth/375.0f))

@interface SPSetupInsetsCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *stepperContainerView;

@property (weak, nonatomic) IBOutlet UIStepper *topStepper;
@property (weak, nonatomic) IBOutlet UIStepper *leftStepper;
@property (weak, nonatomic) IBOutlet UIStepper *rightStepper;
@property (weak, nonatomic) IBOutlet UIStepper *bottomStepper;

@property (weak, nonatomic) IBOutlet UILabel *topValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomValueLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stepperSpace;

@end
@implementation SPSetupInsetsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.topValueLabel.text = [NSString stringWithFormat:@"Top:\n0"];
    self.leftValueLabel.text = [NSString stringWithFormat:@"Left:\n0"];
    self.bottomValueLabel.text = [NSString stringWithFormat:@"Bottom:\n0"];
    self.rightValueLabel.text = [NSString stringWithFormat:@"Right:\n0"];

}

// 模型主要是解决同类cell的数据复用问题
- (void)setModel:(SPInsetsModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.topValueLabel.text = [NSString stringWithFormat:@"Top:\n%.0f",model.topValue];
    self.leftValueLabel.text = [NSString stringWithFormat:@"Left:\n%.0f",model.leftValue];
    self.bottomValueLabel.text = [NSString stringWithFormat:@"Bottom:\n%.0f",model.bottomValue];
    self.rightValueLabel.text = [NSString stringWithFormat:@"Right:\n%.0f",model.rightValue];
    
    self.topStepper.value = model.topValue;
    self.leftStepper.value = model.leftValue;
    self.bottomStepper.value = model.bottomValue;
    self.rightStepper.value = model.rightValue;

}

- (IBAction)topSteperAction:(UIStepper *)sender {
    self.topValueLabel.text = [NSString stringWithFormat:@"Top:\n%.0f",sender.value];
    self.model.topValue = sender.value;
    if ([self.delegate respondsToSelector:@selector(cell:topStepperValueChanged:)]) {
        [self.delegate cell:self topStepperValueChanged:self.model];
    }
}
- (IBAction)leftStepperAction:(UIStepper *)sender {
    self.leftValueLabel.text = [NSString stringWithFormat:@"Left:\n%.0f",sender.value];
    self.model.leftValue = sender.value;
    if ([self.delegate respondsToSelector:@selector(cell:leftStepperValueChanged:)]) {
        [self.delegate cell:self leftStepperValueChanged:self.model];
    }
}

- (IBAction)bottomStepperAction:(UIStepper *)sender {
    self.bottomValueLabel.text = [NSString stringWithFormat:@"Bottom:\n%.0f",sender.value];
    self.model.bottomValue = sender.value;
    if ([self.delegate respondsToSelector:@selector(cell:bottomStepperValueChanged:)]) {
        [self.delegate cell:self bottomStepperValueChanged:self.model];
    }
    
}

- (IBAction)rightStepperAction:(UIStepper *)sender {
    self.rightValueLabel.text = [NSString stringWithFormat:@"Right:\n%.0f",sender.value];
    self.model.rightValue = sender.value;
    if ([self.delegate respondsToSelector:@selector(cell:rightStepperValueChanged:)]) {
        [self.delegate cell:self rightStepperValueChanged:self.model];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // stepper之间的间距适配屏幕
    CGFloat space = 10*([UIScreen mainScreen].bounds.size.width/320.0f);
    self.stepperSpace.constant = space;
    CGFloat myWidth = [UIScreen mainScreen].bounds.size.width - space * 2;
    CGFloat scale = myWidth / self.stepperContainerView.bounds.size.width;
    // 对stepper进行缩放，从而改变stepper的大小，stepper系统默认大小为{94,29},且无法修改
    self.stepperContainerView.transform = CGAffineTransformMakeScale(scale, scale);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
