//
//  ViewController.m
//  TCFStatusBarHUDExample
//
//  Created by 汤春风 on 16/3/19.
//  Copyright © 2016年 tcf. All rights reserved.
//

#import "ViewController.h"
#import "TCFStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)message:(id)sender {
    [TCFStatusBarHUD showMessage:@"一切正常"];
    
}


- (IBAction)success:(id)sender {
    
    [TCFStatusBarHUD showSuccess:@"加载成功!"];
    
    
}
- (IBAction)error:(id)sender {
    [TCFStatusBarHUD showError:@"加载失败!"];
    
}

- (IBAction)loading:(id)sender {
    [TCFStatusBarHUD showLoading:@"正在加载..."];
    
}

- (IBAction)hide:(id)sender {
    
    [TCFStatusBarHUD hide];
}
@end
