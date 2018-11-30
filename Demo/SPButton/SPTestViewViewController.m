//
//  SPTestViewViewController.m
//  SPButton
//
//  Created by 乐升平 on 2018/11/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "SPTestViewViewController.h"
#import "SPAdjustAlignmentCell.h"
#import "SPSetupInsetsCell.h"
#import "SPSliderCell.h"
#import "SPAdjustAlignmentModel.h"
#import "SPSliderModel.h"
#import "SPInsetsModel.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define isIPhoneX MAX(kScreenW, kScreenH) >= 812
#define kNaviHeight (isIPhoneX ? 88 : 64)

static NSString * const adjustAlignmentCellID = @"adjustAlignmentCell";
static NSString * const sliderCellID = @"sliderCell";
static NSString * const setupInsetsCellID = @"setupInsetsCell";

@interface SPTestViewViewController () <UITableViewDataSource, UITableViewDelegate,SPAdjustAlignmentCellDelegate,SPSliderCellDelegate,SPSetupInsetsCellDelegate>
@property (nonatomic, weak) SPButton *button;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation SPTestViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    SPButton *button = [[SPButton alloc] initWithImagePosition:SPButtonImagePositionLeft];
    button.frame = CGRectMake((kScreenW - 200)/2.0, kNaviHeight + 20, 200, 100);
    [button setTitle:@"送你一个微笑" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"Expression_1"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    button.titleLabel.backgroundColor = [UIColor greenColor];
    button.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    self.button = button;

    // 设置图片的位置
    [self setupImagePosition];
    
    [self configureDataSource];
    [self setupTableView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"重置" style:UIBarButtonItemStylePlain target:self action:@selector(clearHistorySetting)];
}

- (void)setupImagePosition {
    switch (_imagePosition) {
        case SPButtonImagePositionLeft: {
            self.navigationItem.title = @"图片在左";
            self.button.imagePosition = SPButtonImagePositionLeft;
        }
            break;
        case SPButtonImagePositionRight: {
            self.navigationItem.title = @"图片在右";
            self.button.imagePosition = SPButtonImagePositionRight;
        }
            break;
        case SPButtonImagePositionTop: {
            self.navigationItem.title = @"图片在上";
            self.button.imagePosition = SPButtonImagePositionTop;
        }
            break;
        case SPButtonImagePositionBottom: {
            self.navigationItem.title = @"图片在下";
            self.button.imagePosition = SPButtonImagePositionBottom;
        }
            break;
        default:
            break;
    }
}

- (void)configureDataSource {
    
    SPAdjustAlignmentModel *alignmentModel = [[SPAdjustAlignmentModel alloc] init];
    alignmentModel.h_selectedSegmentIndex = 0;
    alignmentModel.v_selectedSegmentIndex = 0;
    [self.dataSource addObject:alignmentModel];
    
    SPSliderModel *sliderModel = [[SPSliderModel alloc] init];
    sliderModel.sliderValue = 0.0;
    [self.dataSource addObject:sliderModel];
    
    NSArray *titles = @[@"ContentEdgeInsets",@"ImageEdgeInsets",@"TitleEdgeInsets"];
    NSArray *types = @[@(SPInsetsTypeContent),@(SPInsetsTypeImage),@(SPInsetsTypeTitle)];
    NSMutableArray *insertsModels = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        SPInsetsModel *model = [[SPInsetsModel alloc] init];
        model.title = titles[i];
        model.insetsType = [types[i] integerValue];
        model.topValue = 0.0;
        model.leftValue = 0.0;
        model.bottomValue = 0.0;
        model.rightValue = 0.0;
        [insertsModels addObject:model];
    }
    [self.dataSource addObjectsFromArray:insertsModels];
}

- (void)setupTableView {
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SPAdjustAlignmentCell class]) bundle:nil] forCellReuseIdentifier:adjustAlignmentCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SPSliderCell class]) bundle:nil] forCellReuseIdentifier:sliderCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SPSetupInsetsCell class]) bundle:nil] forCellReuseIdentifier:setupInsetsCellID];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SPAdjustAlignmentCell *cell = [tableView dequeueReusableCellWithIdentifier:adjustAlignmentCellID forIndexPath:indexPath];
        cell.delegate = self;
        cell.model = self.dataSource[indexPath.section];
        return cell;
    } else if (indexPath.section == 1) {
        SPSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:sliderCellID forIndexPath:indexPath];
        cell.delegate = self;
        cell.model = self.dataSource[indexPath.section];
        return cell;
    } else {
        SPSetupInsetsCell *cell = [tableView dequeueReusableCellWithIdentifier:setupInsetsCellID forIndexPath:indexPath];
        cell.delegate = self;
        cell.model = self.dataSource[indexPath.section];
        return cell;
    }
//    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [UIView new];
    header.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - SPAdjustAlignmentCellDelegate

// 水平居中
- (void)cell:(SPAdjustAlignmentCell *)cell h_selectedCenter:(UISegmentedControl *)segmentedControl {
    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
}

// 水平居左
- (void)cell:(SPAdjustAlignmentCell *)cell h_selectedLeft:(UISegmentedControl *)segmentedControl {
    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}

// 水平居右
- (void)cell:(SPAdjustAlignmentCell *)cell h_selectedRight:(UISegmentedControl *)segmentedControl {
    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
}

// 水平填充
- (void)cell:(SPAdjustAlignmentCell *)cell h_selectedFill:(UISegmentedControl *)segmentedControl {
    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    
    if (self.imagePosition == SPButtonImagePositionLeft || self.imagePosition == SPButtonImagePositionRight) {
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"水平填充模式下，先会给titleLabel预留一个宽度，剩余空间由imageView填充，但是titleLabel的位置不发生变化，这是系统按钮原有效果" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"哦，我知道了" style:UIAlertActionStyleDefault handler:nil];
        [alertVc addAction:action];
        [self presentViewController:alertVc animated:YES completion:nil];
    }
}

// 垂直居中
- (void)cell:(SPAdjustAlignmentCell *)cell v_selectedCenter:(UISegmentedControl *)segmentedControl {
    self.button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

// 垂直居上
- (void)cell:(SPAdjustAlignmentCell *)cell v_selectedTop:(UISegmentedControl *)segmentedControl {
    self.button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
}

// 垂直居下
- (void)cell:(SPAdjustAlignmentCell *)cell v_selectedBottom:(UISegmentedControl *)segmentedControl {
    self.button.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
}

// 垂直填充
- (void)cell:(SPAdjustAlignmentCell *)cell v_selectedFill:(UISegmentedControl *)segmentedControl {
    self.button.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;

}

// sizeToFit
- (void)cell:(SPAdjustAlignmentCell *)cell sizeToFitButtonClicked:(UIButton *)sender {
    [self.button sizeToFit];
}

// 取消sizeToFit,设置固定frame
- (void)cell:(SPAdjustAlignmentCell *)cell cancelSizeToFitButtonClicked:(UIButton *)sender {
    self.button.frame = CGRectMake((kScreenW - 200)/2.0, kNaviHeight + 20, 200, 100);
}

#pragma mark - SPSliderCellDelegate

- (void)cell:(id)cell sliderValueChanged:(SPSliderModel *)model {
    self.button.imageTitleSpace = model.sliderValue;
}

#pragma mark - SPSetupInsetsCellDelegate

- (void)cell:(SPSetupInsetsCell *)cell topStepperValueChanged:(SPInsetsModel *)model {
    switch (model.insetsType) {
        case SPInsetsTypeContent: {
            UIEdgeInsets contentEdgeInsets = self.button.contentEdgeInsets;
            contentEdgeInsets.top = model.topValue;
            self.button.contentEdgeInsets = contentEdgeInsets;
        }
            break;
        case SPInsetsTypeImage: {
            UIEdgeInsets imageEdgeInsets = self.button.imageEdgeInsets;
            imageEdgeInsets.top = model.topValue;
            self.button.imageEdgeInsets = imageEdgeInsets;
        }
            break;
        case SPInsetsTypeTitle: {
            UIEdgeInsets titleEdgeInsets = self.button.titleEdgeInsets;
            titleEdgeInsets.top = model.topValue;
            self.button.titleEdgeInsets = titleEdgeInsets;
        }
            break;
    }
}

- (void)cell:(SPSetupInsetsCell *)cell leftStepperValueChanged:(SPInsetsModel *)model {
    switch (model.insetsType) {
        case SPInsetsTypeContent: {
            UIEdgeInsets contentEdgeInsets = self.button.contentEdgeInsets;
            contentEdgeInsets.left = model.leftValue;
            self.button.contentEdgeInsets = contentEdgeInsets;
        }
            break;
        case SPInsetsTypeImage: {
            UIEdgeInsets imageEdgeInsets = self.button.imageEdgeInsets;
            imageEdgeInsets.left = model.leftValue;
            self.button.imageEdgeInsets = imageEdgeInsets;
        }
            break;
        case SPInsetsTypeTitle: {
            UIEdgeInsets titleEdgeInsets = self.button.titleEdgeInsets;
            titleEdgeInsets.left = model.leftValue;
            self.button.titleEdgeInsets = titleEdgeInsets;
        }
            break;
    }
}

- (void)cell:(SPSetupInsetsCell *)cell bottomStepperValueChanged:(SPInsetsModel *)model {
    switch (model.insetsType) {
        case SPInsetsTypeContent: {
            UIEdgeInsets contentEdgeInsets = self.button.contentEdgeInsets;
            contentEdgeInsets.bottom = model.bottomValue;
            self.button.contentEdgeInsets = contentEdgeInsets;
        }
            break;
        case SPInsetsTypeImage: {
            UIEdgeInsets imageEdgeInsets = self.button.imageEdgeInsets;
            imageEdgeInsets.bottom = model.bottomValue;
            self.button.imageEdgeInsets = imageEdgeInsets;
        }
            break;
        case SPInsetsTypeTitle: {
            UIEdgeInsets titleEdgeInsets = self.button.titleEdgeInsets;
            titleEdgeInsets.bottom = model.bottomValue;
            self.button.titleEdgeInsets = titleEdgeInsets;
        }
            break;
    }
}

- (void)cell:(SPSetupInsetsCell *)cell rightStepperValueChanged:(SPInsetsModel *)model {
    switch (model.insetsType) {
        case SPInsetsTypeContent: {
            UIEdgeInsets contentEdgeInsets = self.button.contentEdgeInsets;
            contentEdgeInsets.right = model.rightValue;
            self.button.contentEdgeInsets = contentEdgeInsets;
        }
            break;
        case SPInsetsTypeImage: {
            UIEdgeInsets imageEdgeInsets = self.button.imageEdgeInsets;
            imageEdgeInsets.right = model.rightValue;
            self.button.imageEdgeInsets = imageEdgeInsets;
        }
            break;
        case SPInsetsTypeTitle: {
            UIEdgeInsets titleEdgeInsets = self.button.titleEdgeInsets;
            titleEdgeInsets.right = model.rightValue;
            self.button.titleEdgeInsets = titleEdgeInsets;
        }
            break;
    }
}

// 清空历史设置，还原到初始样子
- (void)clearHistorySetting {
    
    self.button.frame = CGRectMake((kScreenW - 200)/2.0, kNaviHeight + 20, 200, 100);
    self.button.contentEdgeInsets = UIEdgeInsetsZero;
    self.button.imageEdgeInsets = UIEdgeInsetsZero;
    self.button.titleEdgeInsets = UIEdgeInsetsZero;
    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.button.imageTitleSpace = 0.0;
    
    for (NSObject *model in self.dataSource) {
        if ([model isKindOfClass:[SPAdjustAlignmentModel class]]) {
            SPAdjustAlignmentModel *alignmentModel = (SPAdjustAlignmentModel *)model;
            alignmentModel.h_selectedSegmentIndex = 0;
            alignmentModel.v_selectedSegmentIndex = 0;
        } else if ([model isKindOfClass:[SPSliderModel class]]) {
            SPSliderModel *sliderModel = (SPSliderModel *)model;
            sliderModel.sliderValue = 0.0;
        } else if ([model isKindOfClass:[SPInsetsModel class]]) {
            SPInsetsModel *insertsModel = (SPInsetsModel *)model;
            insertsModel.topValue = 0.0;
            insertsModel.leftValue = 0.0;
            insertsModel.bottomValue = 0.0;
            insertsModel.rightValue = 0.0;
        }
    }
    [self.tableView reloadData];
}

#pragma mark - lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.button.frame)+20, kScreenW, kScreenH-CGRectGetMaxY(self.button.frame)-20) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
