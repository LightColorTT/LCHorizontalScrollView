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
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setSelectedDate:[NSDate date]];
        _timeLabel.text = [NSString stringWithFormat:@"%@",_selectedDate];
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
- (void)createGradientViaView:(UIView *)view {
    CAGradientLayer *gradientMask = [CAGradientLayer layer];
    gradientMask.frame = view.bounds;
    gradientMask.startPoint = CGPointMake(0.0, 0.5);   // start at left middle
    gradientMask.endPoint = CGPointMake(1.0, 0.5);
    gradientMask.colors = @[(id)[UIColor darkGrayColor].CGColor,
                            (id)[UIColor lightGrayColor].CGColor,
                            (id)[UIColor whiteColor].CGColor,
                            (id)[UIColor lightGrayColor].CGColor,
                            (id)[UIColor darkGrayColor].CGColor];
    gradientMask.locations = @[@0.0, @0.20, @0.50, @0.80, @1.0];
    [view.layer addSublayer:gradientMask];
    
}

- (void)addDateScrollView {
    self.creater = [[LCGenerateScrollView alloc] init];
    [self.dateScrollView layoutIfNeeded];
    [self createGradientViaView:self.dateScrollView];
    [self.creater createScrollViewtheLastDate:[NSDate date]
                                 selectedDate:[NSDate date]
                                 countDaysAgo:7];
    self.creater.delegate = self;
}

- (void)didChangeValueDateScrollView:(NSDate*)date
{
    self.selectedDate = date;
    self.timeLabel.text = [NSString stringWithFormat:@"%@", date];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
