//
//  ViewController.m
//  GCDTimer
//
//  Created by renjinwei on 2021/1/2.
//  Copyright © 2021 renjinwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if (!self.timer) {
        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
        //最后参数设置精确度，
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC, 0.01 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(timer, ^{
            NSLog(@"timer trigger -- %@", [NSThread currentThread]);
        });
        dispatch_resume(timer);
        NSLog(@"create timer");
        self.timer = timer;
    }

    for (int i = 0; i < 1000; i ++) {
        NSLog(@"xxxxxxxxxx--%@", [NSThread currentThread]);
    }
}
@end
