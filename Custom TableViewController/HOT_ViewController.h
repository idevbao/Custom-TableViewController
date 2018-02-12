//
//  HOT_ViewController.h
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 12/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myData.h"
#import "CellFood.h"

@interface HOT_ViewController : UIViewController< UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray* mArrayCategoryMilk;
@property(nonatomic,strong)NSMutableArray* mArrayCategoryTea;
@property(nonatomic,strong)NSMutableArray* mArrayCategoryCoffee;
@property(nonatomic,strong)NSMutableArray* mArrayProduct;

@end
