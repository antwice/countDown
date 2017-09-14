//
//  ViewController.m
//  gcd
//
//  Created by hcy on 2017/9/13.
//  Copyright © 2017年 HCY. All rights reserved.
//

#import "ViewController.h"
static int _totalTime;
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ViewController *viewc=[[ViewController alloc]init];
//    [viewc createCountDown:60 antwiceCountDownBlock:^(int countdown) {
//        NSLog(@"%d",countdown);
//    } finishBlock:^{
//        NSLog(@"end");
//    }];
    //或者
    [ViewController CountDown:60 antwiceCountDownBlock:^(int countdown) {
        NSLog(@"%d",countdown);
    } finishBlock:^{
        NSLog(@"end");
    }];
    
    
    
}
+(void)CountDown:(int)totalTime antwiceCountDownBlock:(antwice)antwiceCountDownBlock finishBlock:(finish)finishBlock
{
    [[[self alloc]init]createCountDown:totalTime antwiceCountDownBlock:antwiceCountDownBlock finishBlock:finishBlock];
}
-(void)createCountDown:(int)totalTime antwiceCountDownBlock:(antwice)antwiceCountDownBlock finishBlock:(finish)finishBlock
{
    _totalTime=totalTime;
    self.antwiceCountDownBlock=antwiceCountDownBlock;
    self.finishBlock = finishBlock;
    [self openCountDown];
    
}
-(void)openCountDown{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if (_totalTime>0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (_antwiceCountDownBlock) {
                    _antwiceCountDownBlock(_totalTime);
                }
                
            });
        }else
        {
            NSLog(@"倒计时结束");
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (_finishBlock) {
                    _finishBlock();
                }
            });
        }
        _totalTime --;
    });
    
    dispatch_resume(_timer);//开启定时器
}
@end
