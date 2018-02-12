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
@interface FOOD_ViewController : UIViewController< UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* mArrayCategoryMilk;
@property(nonatomic,strong)NSMutableArray* mArrayCategoryTea;
@property(nonatomic,strong)NSMutableArray* mArrayCategoryCoffee;
@property(nonatomic,strong)NSMutableArray* mArrayProduct;
@end
