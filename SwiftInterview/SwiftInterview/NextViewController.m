//
//  NextViewController.m
//  SwiftInterview
//
//  Created by xubojoy on 2017/8/8.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

#import "NextViewController.h"
#import "SwiftInterview-Swift.h"
static inline
void longBytes(char *value, unsigned int length);


@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *brandBtn = [[UIButton alloc] initWithFrame:CGRectMake(50 , 100, 50, 50)];
    brandBtn.backgroundColor = [UIColor purpleColor];
    [brandBtn setTitle:@"品牌" forState:UIControlStateNormal];
    [brandBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [brandBtn addTarget:self action:@selector(gotoAllBrand) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:brandBtn];
}

- (void)gotoAllBrand{
    SecondViewController *secondvc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
