//
//  LBMineViewController.m
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import "LBMineViewController.h"
#import "GLD_WeiboListController.h"


@interface LBMineViewController ()


@end

@implementation LBMineViewController

- (instancetype)initWithTitle:(NSString *)title onClick:(void (^)(void))clickHandler{
    self = [super initWithTitle:title];
    if (self) {
        
        UIButton *but = [self button];
        
        @weakify(self);
        //创建命令并强引用，防止释放不生效
        but.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            !clickHandler ?: clickHandler();
            @strongify(self);
            GLD_WeiboListController *vc = [GLD_WeiboListController new];
            //创建信号
            vc.delegateSubject = [RACSubject subject];
            //订阅信号
            [vc.delegateSubject subscribeNext:^(id x) {
                NSLog(@"delegate生效了=====%@",x);
            }];
            [self.navigationController pushViewController:vc animated:YES];
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                //发送
                [subscriber sendNext:@"请求数据"];
                //告知命令执行完毕
                [subscriber sendCompleted];
                return [RACDisposable disposableWithBlock:^{
                    NSLog(@"资源释放完毕");
                }];
            }];
            
            
            
            
            
            
        }];
        
        //订阅command中的信号
        [but.rac_command.executionSignals subscribeNext:^(id x) {
            [x subscribeNext:^(id x) {
                NSLog(@"----%@\n",x);
            }];
        }];
        //高级用法
        [but.rac_command.executionSignals.switchToLatest subscribeNext:^(id x) {
            NSLog(@"---%@\n",x);
        }];
//        [[but.rac_command.executing skip:1] subscribeNext:^(id x) {
//            if ([x boolValue] == YES) {
//                NSLog(@"正在执行");
//            }
//            else{
//                NSLog(@"执行完成");
//            }
//        }];
        [but.rac_command execute:@1];
        [self.view addSubview:but];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (UIButton *)button {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 200, CGRectGetWidth([UIScreen mainScreen].bounds), 100);
    button.title = @"点一下";
    [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    return button;
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
