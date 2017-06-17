//
//  ViewController.m
//  Dayh1_StopWatch2
//
//  Created by Student P_02 on 18/05/17.
//  Copyright © 2017 Felix ITs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timerLabel.layer.borderWidth=2.0;
    self.timerLabel.layer.borderColor=[[UIColor blackColor] CGColor];
    self.timerLabel.layer.masksToBounds = YES;
    self.timerLabel.layer.cornerRadius=80;
    self.timerLabel.text=@"00.00.00.000";
    running=NO;
    startDate=[NSDate date];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)reset_Button:(id)sender
{
    [stopTimer invalidate];
    stopTimer=nil;
    startDate=[NSDate date];
    self.timerLabel.text=@"00.00.00.000";
    running=NO;
    
}

- (IBAction)Start_button:(id)sender
{
    UIButton *button=sender;
    if (!running)
    {
        running=YES;
        [button setTitle:@"Stop" forState:UIControlStateNormal];
    if(stopTimer==nil)
        
        {
            stopTimer=[NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
           
        }
    }
    else
    {
        running=NO;
        [button setTitle:@"Start" forState:UIControlStateNormal];
        [stopTimer invalidate];
        stopTimer=nil;
    }
}

-(void)updateTimer
{
    NSDate *currentDate=[NSDate date];
    NSTimeInterval timeInterval=[currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate=[NSDate dateWithTimeIntervalSinceNow:timeInterval];
    NSDateFormatter *dateFormater=[[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"hh:mm:ss.SSS"];
    NSString *timerString=[dateFormater stringFromDate:timerDate];
    self.timerLabel.text=timerString;
}
@end
