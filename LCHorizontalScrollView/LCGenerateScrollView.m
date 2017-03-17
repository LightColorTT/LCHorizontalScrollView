//
//  LCGenerateScrollView.m
//  LCHorizontalScrollView
//
//  Created by Vio on 16.03.17.
//  Copyright © 2017 LightColor. All rights reserved.
//

#import "LCGenerateScrollView.h"
#import "LCHorizontalListElement.h"

@interface LCGenerateScrollView () <HorizontalScrollViewListElementsDelegate, HorizontalScrollViewListElementsDataSource>

@property (nonatomic, strong) LCHorizontalListElement *selectionList;
@property (nonatomic, strong) NSMutableArray *arrayData;
@property (nonatomic, strong) UILabel *selectedItemLabel;
@property (nonatomic) NSInteger firstSelectedButton;

@end

@implementation LCGenerateScrollView

- (BOOL)isEqualDate:(NSDate*)date isBetweenDate:(NSDate*)selectDate
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:selectDate];
    if([components day] == [components2 day] && [components month] == [components2 month] && [components year] == [components2 year])
        return YES;
    return NO;
}

- (NSMutableArray *)arrayFromDates:(NSDate *)theLastDate selectedDate:(NSDate *)dateSelect countDaysAgo:(int)days
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    [formatter setDateFormat:@"d MMMM"];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *stringDate;
    NSDate *dateDaysAgo = [theLastDate dateByAddingTimeInterval:-days*24*60*60];
    NSDateComponents *components;
    int i = 0;
    for (NSDate *dateNew = dateDaysAgo; [dateNew compare:theLastDate] != NSOrderedDescending; dateNew = [dateNew dateByAddingTimeInterval:+24*60*60])
    {
        if([self isEqualDate:dateNew isBetweenDate:dateSelect]) {
            self.selectionList.selectedButtonIndex = i;
        } else {
            i++;
        }
        
        components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:dateNew];
        stringDate = [[formatter stringFromDate:dateNew] stringByReplacingOccurrencesOfString:@"." withString:@""];
        [array addObject:stringDate];
    }
    return array;
}


- (void)createScrollViewtheLastDate:(NSDate *)theLastDate selectedDate:(NSDate *)dateSelect countDaysAgo:(int)days {
    
    self.selectionList = [[LCHorizontalListElement alloc] init];
    
    self.selectionList.delegate = self;
    self.selectionList.dataSource = self;
    self.arrayData = [self arrayFromDates:theLastDate selectedDate:dateSelect countDaysAgo:days];
    self.dateSelectedNow = dateSelect;
    self.dateLast = theLastDate;
    
}
- (void) createScrollView:(UIView *)newView
{
    self.selectionList = [self.selectionList initWithFrame:newView.bounds];
    self.selectionList.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.selectionList layoutIfNeeded];
    [newView addSubview:self.selectionList];
    [self.selectionList buttonClick];
    
}

- (NSInteger)numberOfItemsInSelectionList:(LCHorizontalListElement *)selectionList {
    return self.arrayData.count;
}

- (NSString *)selectionList:(LCHorizontalListElement *)selectionList titleForItemWithIndex:(NSInteger)index {
    return self.arrayData[index];
}

- (void)selectionList:(LCHorizontalListElement *)selectionList didSelectButtonWithIndex:(NSInteger)index {
    self.selectedItemLabel.text = self.arrayData[index];
}

- (void)selectionList:(LCHorizontalListElement *)selectionList getSelectedIndexButton:(NSInteger)index{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    [dateFormat setDateFormat:@"d MMMM"];
    self.dateSelectedNow =[dateFormat dateFromString:self.arrayData[self.selectionList.selectedIndexNow]];
    [self.delegate didChangeValueDateScrollView:self.dateSelectedNow];
}
@end
