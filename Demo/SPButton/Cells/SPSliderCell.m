//
//  SPSliderCell.m
//  SPButton
//
//  Created by 乐升平 on 2018/11/29.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "SPSliderCell.h"
#import "SPSliderModel.h"

@interface SPSliderCell()
@property (weak, nonatomic) IBOutlet UILabel *currentValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end
@implementation SPSliderCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setModel:(SPSliderModel *)model {
    _model = model;
    self.currentValueLabel.text = [NSString stringWithFormat:@"%.1f",model.sliderValue];
    self.slider.value = model.sliderValue;
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.model.sliderValue = sender.value;
    self.currentValueLabel.text = [NSString stringWithFormat:@"%.1f",sender.value];
    if ([self.delegate respondsToSelector:@selector(cell:sliderValueChanged:)]) {
        [self.delegate cell:self sliderValueChanged:self.model];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
