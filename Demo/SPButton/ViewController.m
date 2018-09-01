//
//  ViewController.m
//  SPButton
//
//  Created by develop1 on 2018/8/31.
//  Copyright © 2018年 Cookie. All rights reserved.
//

#import "ViewController.h"
#import "SPButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    SPButton *button1 = [[SPButton alloc] initWithImageRatio:0.5];
    button1.frame = CGRectMake(50, 140, 100, 30);
    [button1 setTitle:@"狗狗" forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"dog"] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor redColor];
    button1.titleLabel.font = [UIFont systemFontOfSize:14];
    button1.titleLabel.backgroundColor = [UIColor greenColor];
    button1.imageView.backgroundColor = [UIColor yellowColor];
    button1.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    button1.imageTitleSpace = 5;
    [self.view addSubview:button1];

    SPButton *button2 = [[SPButton alloc] initWithImageRatio:0.5];
    button2.frame = CGRectMake(200, 120, 60, 90);
    [button2 setTitle:@"狗狗" forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"dog"] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor redColor];
    button2.titleLabel.font = [UIFont systemFontOfSize:14];
    button2.titleLabel.backgroundColor = [UIColor greenColor];
    button2.imageView.backgroundColor = [UIColor yellowColor];
    button2.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    button2.imagePosition = SPButtonImagePositionTop;
    button2.imageTitleSpace = 5;
    [self.view addSubview:button2];

    SPButton *button3 = [[SPButton alloc] initWithImageRatio:0.5];
    button3.frame = CGRectMake(50, 260, 60, 90);
    [button3 setTitle:@"狗狗" forState:UIControlStateNormal];
    [button3 setImage:[UIImage imageNamed:@"dog"] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor redColor];
    button3.titleLabel.font = [UIFont systemFontOfSize:14];
    button3.titleLabel.backgroundColor = [UIColor greenColor];
    button3.imageView.backgroundColor = [UIColor yellowColor];
    button3.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    button3.imagePosition = SPButtonImagePositionBottom;
    button3.imageTitleSpace = 5;
    [self.view addSubview:button3];

    SPButton *button4 = [[SPButton alloc] initWithImageRatio:0.5];
    button4.frame = CGRectMake(180, 290, 100, 30);
    [button4 setTitle:@"狗狗" forState:UIControlStateNormal];
    [button4 setImage:[UIImage imageNamed:@"dog"] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor redColor];
    button4.titleLabel.font = [UIFont systemFontOfSize:14];
    button4.titleLabel.backgroundColor = [UIColor greenColor];
    button4.imageView.backgroundColor = [UIColor yellowColor];
    button4.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    button4.imagePosition = SPButtonImagePositionRight;
    button4.imageTitleSpace = 5;
    [self.view addSubview:button4];


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
