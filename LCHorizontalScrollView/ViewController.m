//
//  ViewController.m
//  LCHorizontalScrollView
//
//  Created by Vio on 16.03.17.
//  Copyright © 2017 LightColor. All rights reserved.
//

#import "ViewController.h"
#import "LCGenerateScrollView.h"

@interface ViewController () <OTCreaterScrollViewDelegate>

@property (strong, nonatomic) LCGenerateScrollView *creater;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didChangeValueDateScrollView:(NSDate*)date {
    [self updateButtonsForDate:date];
    self.selectedDate = date;
}

- (void)addDateScrollView {
    self.creater = [[LCGenerateScrollView alloc] init];
    [self.creater createScrollViewLastLabel:[UILabel new] selectedLabel:[UILabel new] countLabelAgo:7];
    self.creater.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
