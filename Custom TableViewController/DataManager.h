//
//  DataManager.h
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 13/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myData.h"

@interface DataManager : NSObject
@property(nonatomic,strong)NSMutableArray* mArrayCategoryMilk;
@property(nonatomic,strong)NSMutableArray* mArrayCategoryTea;
@property(nonatomic,strong)NSMutableArray* mArrayCategoryCoffee;
@property(nonatomic,strong)NSMutableArray* mArrayProduct;
+(instancetype)getData;
@end
