//
//  ViewController.h
//  gcd
//
//  Created by hcy on 2017/9/13.
//  Copyright © 2017年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^antwice)(int countdown);
typedef void (^finish)();
@interface ViewController : UIViewController
@property(nonatomic,strong)antwice antwiceCountDownBlock;
@property(nonatomic,strong)finish finishBlock;
-(void)createCountDown:(int)totalTime antwiceCountDownBlock:(antwice)antwiceCountDownBlock finishBlock:(finish)finishBlock;
+(void)CountDown:(int)totalTime antwiceCountDownBlock:(antwice)antwiceCountDownBlock finishBlock:(finish)finishBlock;
@end

