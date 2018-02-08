//
//  TableViewController.h
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "ViewController.h"

#import "myData.h"
@class ViewController;
@protocol Passdata;
@interface TableViewController : UITableViewController < UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray* mArrayCategoryMilk;
@property(nonatomic,strong)NSMutableArray* mArrayCategoryTea;
@property(nonatomic,strong)NSMutableArray* mArrayCategoryCoffee;
@property(nonatomic,strong)NSMutableArray* mArrayProduct;




@end
