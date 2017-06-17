//
//  ViewController.h
//  Dayh1_StopWatch2
//
//  Created by Student P_02 on 18/05/17.
//  Copyright © 2017 Felix ITs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL running;
    //NSTimeInterval startTime;
    NSTimer *stopTimer;
    NSDate *startDate;
}


@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
- (IBAction)reset_Button:(id)sender;
- (IBAction)Start_button:(id)sender;

-(void)updateTimer;

@end

