//
//  FoodScroll.m
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 12/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "FoodScroll.h"

@implementation FoodScroll

-(instancetype)initFoodScroll:(int)numberView withHeight:(float)height andWidth:(float)width{
    self = [super init];
    self.frame = CGRectMake(0, 60, width, height);
    self.contentSize  = CGSizeMake(numberView* width/3, height);
//    self.pagingEnabled = YES;
//    self.bounces = YES; // if YES, bounces past edge of content and back again
//    self.showsVerticalScrollIndicator = YES; // goi y nguoi dung quet ngang quet doc
//    self.showsHorizontalScrollIndicator = YES;

    NSMutableArray * array;
    for (int i=1; i<numberView; i++) {
        UIView * nameView = [UIView new];
        [array addObject:nameView];
        nameView.frame = CGRectMake((i-0) *width/3, 0, width/3, height);
        [self addSubview:nameView];
        if (i %2) {
            nameView.backgroundColor = [UIColor grayColor];
        }
    }
    return self;
}
@end
