//
//  LCGenerateScrollView.h
//  LCHorizontalScrollView
//
//  Created by Vio on 16.03.17.
//  Copyright © 2017 LightColor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OTCreaterScrollViewDelegate;

@interface LCGenerateScrollView : NSObject

@property (weak, nonatomic) id<OTCreaterScrollViewDelegate> delegate;

@property (strong, nonatomic) NSDate *dateSelectedNow;
@property (strong, nonatomic) NSDate *dateLast;

- (void) createScrollViewtheLastDate:(NSDate *)theLastDate selectedDate:(NSDate *)dateSelect countDaysAgo:(int) days;
- (void) createScrollView:(UIView *)newView ;

@end

@protocol OTCreaterScrollViewDelegate <NSObject>

- (void)didChangeValueDateScrollView:(NSDate*)date;

@end
