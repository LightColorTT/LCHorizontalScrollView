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

@property (strong, nonatomic) UILabel *labelSelectedNow;
@property (strong, nonatomic) UILabel *labelLast;

- (void)createScrollViewLastLabel:(UILabel *)lastLabel selectedLabel:(UILabel *)labelSelect countLabelAgo:(NSInteger)label;
- (void)createScrollView:(UIView *)newView;

@end

@protocol OTCreaterScrollViewDelegate <NSObject>

- (void)didChangeValueDateScrollView:(NSDate*)date;

@end
