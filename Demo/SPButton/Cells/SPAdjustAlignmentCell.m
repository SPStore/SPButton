//
//  SPAdjustImagePositionCell.m
//  SPButton
//
//  Created by 乐升平 on 2018/11/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "SPAdjustAlignmentCell.h"
#import "SPAdjustAlignmentModel.h"

@interface SPAdjustAlignmentCell()
@property (weak, nonatomic) IBOutlet UISegmentedControl *h_segmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *v_segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *cancelSizeToFitButton;
@property (weak, nonatomic) IBOutlet UIButton *sizeToFitButton;

@end

@implementation SPAdjustAlignmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.sizeToFitButton.layer.cornerRadius = 5;
    self.sizeToFitButton.layer.borderWidth = 1;
    self.sizeToFitButton.layer.borderColor = [UIColor colorWithRed:.0/255.0 green:122.4/255.0 blue:255.0/255.0 alpha:1.0].CGColor;
    self.cancelSizeToFitButton.layer.cornerRadius = 5;
    self.cancelSizeToFitButton.layer.borderWidth = 1;
    self.cancelSizeToFitButton.layer.borderColor = [UIColor colorWithRed:.0/255.0 green:122.4/255.0 blue:255.0/255.0 alpha:1.0].CGColor;
}

- (void)setModel:(SPAdjustAlignmentModel *)model {
    _model = model;
    self.h_segmentedControl.selectedSegmentIndex = model.h_selectedSegmentIndex;
    self.v_segmentedControl.selectedSegmentIndex = model.v_selectedSegmentIndex;
}

- (IBAction)h_segmentControlAction:(UISegmentedControl *)sender {
    self.model.h_selectedSegmentIndex = sender.selectedSegmentIndex;
    switch (sender.selectedSegmentIndex) {
        case 0:
            if ([self.delegate respondsToSelector:@selector(cell:h_selectedCenter:)]) {
                [self.delegate cell:self h_selectedCenter:sender];
            }
            break;
        case 1:
            if ([self.delegate respondsToSelector:@selector(cell:h_selectedLeft:)]) {
                [self.delegate cell:self h_selectedLeft:sender];
            }
            break;
        case 2:
            if ([self.delegate respondsToSelector:@selector(cell:h_selectedRight:)]) {
                [self.delegate cell:self h_selectedRight:sender];
            }
            break;
        case 3:
            if ([self.delegate respondsToSelector:@selector(cell:h_selectedFill:)]) {
                [self.delegate cell:self h_selectedFill:sender];
            }
            break;
    }
}

- (IBAction)v_segmentControlAction:(UISegmentedControl *)sender {
    self.model.v_selectedSegmentIndex = sender.selectedSegmentIndex;
    switch (sender.selectedSegmentIndex) {
        case 0:
            if ([self.delegate respondsToSelector:@selector(cell:v_selectedCenter:)]) {
                [self.delegate cell:self v_selectedCenter:sender];
            }
            break;
        case 1:
            if ([self.delegate respondsToSelector:@selector(cell:v_selectedTop:)]) {
                [self.delegate cell:self v_selectedTop:sender];
            }
            break;
        case 2:
            if ([self.delegate respondsToSelector:@selector(cell:v_selectedBottom:)]) {
                [self.delegate cell:self v_selectedBottom:sender];
            }
            break;
        case 3:
            if ([self.delegate respondsToSelector:@selector(cell:v_selectedFill:)]) {
                [self.delegate cell:self v_selectedFill:sender];
            }
            break;
    }
}
- (IBAction)sizeToFitButtonAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(cell:sizeToFitButtonClicked:)]) {
        [self.delegate cell:self sizeToFitButtonClicked:sender];
    }
}

- (IBAction)cancelSizeToFitButtonAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(cell:cancelSizeToFitButtonClicked:)]) {
        [self.delegate cell:self cancelSizeToFitButtonClicked:sender];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
