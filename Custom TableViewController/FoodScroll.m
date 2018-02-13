//
//  FoodScroll.m
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 12/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "FoodScroll.h"

@implementation FoodScroll

-(instancetype)initFoodScroll:(int)numberView withHeight:(float)height andWidth:(float)width view:(UIViewController*)viewctr{
    self = [super init];
    

    CGFloat naviHeight = viewctr.navigationController.navigationBar.frame.size.height +[UIApplication sharedApplication].statusBarFrame.size.height;
    self.bounces = NO;
    self.frame = CGRectMake(0, naviHeight, width, height);
    self.contentSize  = CGSizeMake(width*3, height); // noi dung  cua scroll co the keo tha
//    self.pagingEnabled = YES;
//    self.bounces = YES; // if YES, bounces past edge of content and back again
//    self.showsVerticalScrollIndicator = YES; // goi y nguoi dung quet ngang quet doc
//    self.showsHorizontalScrollIndicator = YES;
    self.pagingEnabled = YES;

    

    NSMutableArray * array;
    for (int i=0; i<numberView; i++) {
        UIView * nameView = [UIView new];
        [array addObject:nameView];
        nameView.frame = CGRectMake((i-0) *width/3, 0, width/3, height);
        [self addSubview:nameView];
        if (i %2) {
            nameView.backgroundColor = [UIColor whiteColor];
        }else{
        nameView.backgroundColor = [UIColor orangeColor];
        }
    }
    return self;
}
@end
