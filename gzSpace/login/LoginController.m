//
//  YDBLoginController.m
//  EasyRiding
//
//  Created by PaulLi on 2017/11/29.
//  Copyright © 2017年 易代步. All rights reserved.
//

#import "LoginController.h"
#import "UIColor+YYAdd.h"
@interface LoginController ()
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UITextField *codeText;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic, assign) int duration;
@property (nonatomic, assign) NSTimeInterval beforeDate;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loginButton setLayerShadow:[UIColor colorWithHexString:@"0c5135"] offset:CGSizeMake(0, 3) radius:5];
    self.loginButton.layer.shadowOpacity = 0.3;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (IBAction)serviceProtocolAction:(id)sender {
   
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
