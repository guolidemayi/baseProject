//
//  GLD_WeiboListController.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/10.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_WeiboListController.h"
#import "GLD_UserModel.h"
#import "RACDynamicSequence.h"
#import "GLD_SegmentView.h"

@interface GLD_WeiboListController ()

@property (nonatomic, strong)RACCommand *command;
@property (nonatomic, strong)UITextField *textfield;
@end

@implementation GLD_WeiboListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    GLD_SegmentView *redv = [GLD_SegmentView new];
   
    [self.view addSubview:redv];
    redv.frame = CGRectMake(50, 40, 50, 40);
    redv.backgroundColor = [UIColor redColor];
    
    UIButton *btu = [UIButton new];
    [redv addSubview:btu];
    btu.frame = CGRectMake(10, 10, 30, 30);
    [btu addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
 
    
    _textfield = [UITextField new];
    [self.view addSubview:_textfield];
    
    _textfield.frame = CGRectMake(100, 100, 100, 100);
    RAC(self,title) = RACObserve(self, textfield.text);
    _textfield.borderStyle = UITextBorderStyleBezel;
//#pragma("clang diagnostic push")
//#pragma("clang diagnostic ignored "-Warc-performSelector-leaks"")
    [self performSelector:@selector(multiRequest) withObject:nil];
//#pragma("clang diagnostic pop")
    [self creatSignal];
}

//多个网络请求，统一处理
- (void)multiRequest{
    RACSignal *request1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [subscriber sendNext:@1];
            [subscriber sendCompleted];
        });
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"raquest1 disposable");
        }];
    }];
    RACSignal *request2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      
        [subscriber sendNext:@2];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"request2 disposable");
        }];
    }];
    
    [self rac_liftSelector:@selector(butClick:s2:) withSignalsFromArray:@[request1,request2]];
}
//统一处理网络请求
- (void)butClick:(id)data s2:(id)data2{
    NSLog(@"data = %@\n data2 = %@\n",data,data2);
}
static NSInteger num = 0;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self sendSignal];
}
/**
- (void)commandSignalTest{
    RACCommand *command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [subscriber sendNext:@(num++)];
            [subscriber sendCompleted];
            
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }];
    //强引用，防止命令执行的时候释放命令
    self.command = command;
    [self.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        
        NSLog(@"%@\n",x);
    }];
    
}


- (void)commandSubscribe{
    // 5.执行命令
    [self.command execute:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self.command execute:@1];
    });
}
 */
- (void)sendSignal{
    if (self.delegateSubject) {
        //订阅信号，即可收到信号发送的内容
        [self.delegateSubject subscribeNext:^(id x) {
            NSLog(@"-----%@",x);
        }];
    }
}

- (void)creatSignal{
 
    //创建信号
    self.delegateSubject = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        //发送信号
        [subscriber sendNext:@"dddd"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [subscriber sendNext:@"ccccc"];
        });
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"++++++");
        }];
    }] doNext:^(id x) {
        NSLog(@"doNext");
    }];
    
    
}

- (void)RACchangeToArray{
    
    NSDictionary *dict = @{@"name":@"1",@"age":@"2"};
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        [arr addObject:dict];
    }
    
    NSArray *arr1 = [[arr.rac_sequence map:^id(id value) {
        return [GLD_UserModel yy_modelWithDictionary:value];
    }] array];
    
    //分步操作
    //映射成一个动态的集合
    RACDynamicSequence *ddd = [arr.rac_sequence map:^id(id value) {
        return [GLD_UserModel yy_modelWithDictionary:value];
    }];
    
    NSArray *arr2 = ddd.array;
    
    //arr1 和arr2 是数组内容相同
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"%@-->死了\n",self.description);
}

@end
