//
//  ViewController.m
//  SPButton
//
//  Created by 乐升平 on 2018/11/20.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "ViewController.h"
#import "SPTestViewViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"按钮图片的位置";

    self.dataSource = @[
                          @{@"name":@"图片在左",
                            @"position":@(SPButtonImagePositionLeft)
                            },
                          @{@"name":@"图片在右",
                            @"position":@(SPButtonImagePositionRight)
                            },
                          @{@"name":@"图片在上",
                            @"position":@(SPButtonImagePositionTop)
                            },
                          @{@"name":@"图片在下",
                            @"position":@(SPButtonImagePositionBottom)
                            },
                        ];

    [self.view addSubview:self.tableView];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary *dic = self.dataSource[indexPath.row];
    cell.textLabel.text = dic[@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SPTestViewViewController *testVc = [[SPTestViewViewController alloc] init];
    NSDictionary *dic = self.dataSource[indexPath.row];
    testVc.imagePosition = [dic[@"position"] integerValue];
    [self.navigationController pushViewController:testVc animated:YES];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
