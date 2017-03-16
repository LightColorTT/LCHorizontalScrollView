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

- (void)createScrollViewLastLabel:(UILabel *)lastLabel selectedLabel:(UILabel *)labelSelect countLabelAgo:(NSInteger)label {
    
    self.selectionList = [[LCHorizontalListElement alloc] init];
    self.selectionList.delegate = self;
    self.selectionList.dataSource = self;
    self.arrayData = [self createListLabel];
    self.labelSelectedNow = labelSelect;
    self.labelLast = lastLabel;
    
}
- (void) createScrollView:(UIView *)newView
{
    self.selectionList = [self.selectionList initWithFrame:newView.bounds];
    self.selectionList.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.selectionList layoutIfNeeded];
    [newView addSubview:self.selectionList];
    [self.selectionList buttonClick];
    
}

- (NSMutableArray *)createListLabel {
    NSMutableArray* tempArray = [NSMutableArray new];
    
    for (NSInteger i = 0; i < 7; i++) {
        UILabel* tempLabel = [UILabel new];
        tempLabel.text = [NSString stringWithFormat:@"label %ld", i];
        [tempArray addObject:tempLabel];
    }
    return [tempArray copy];
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
    self.labelSelectedNow = self.arrayData[self.selectionList.selectedIndexNow];
    [self.delegate didChangeValueDateScrollView:self.labelSelectedNow];
}
]

@end
