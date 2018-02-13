//
//  FOOD_ViewController.h
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 11/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myData.h"
#import "CellFood.h"
#import "FoodScroll.h"
#import "DataManager.h"
@interface FOOD_ViewController : UIViewController< UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>

@property(nonatomic,assign)CGFloat heightFood;
@end
