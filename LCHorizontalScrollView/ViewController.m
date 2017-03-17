//
//  ViewController.m
//  LCHorizontalScrollView
//
//  Created by Vio on 16.03.17.
//  Copyright © 2017 LightColor. All rights reserved.
//

#import "ViewController.h"
#import "LCGenerateScrollView.h"

@interface ViewController () <OTCreaterScrollViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) LCGenerateScrollView *creater;
@property (strong, nonatomic) NSDate *selectedDate;
@property (weak, nonatomic) IBOutlet UIView *dateScrollView;

@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setSelectedDate:[NSDate date]];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDateScrollView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.creater createScrollView:self.dateScrollView];
    
}

- (void)addDateScrollView {
    self.creater = [[LCGenerateScrollView alloc] init];
    [self.dateScrollView layoutIfNeeded];
    [self.creater createScrollViewtheLastDate:[NSDate date]
                                 selectedDate:[NSDate date]
                                 countDaysAgo:7];
    self.creater.delegate = self;
}

- (void)didChangeValueDateScrollView:(NSDate*)date
{
    self.selectedDate = date;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
