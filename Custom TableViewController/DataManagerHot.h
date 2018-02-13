//
//  DataManagerHot.h
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 13/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myData.h"

@interface DataManagerHot : NSObject
@property(nonatomic,strong)NSMutableArray* mArrayCategoryHOT;

@property(nonatomic,strong)NSMutableArray* mArrayProduct;
+(instancetype)getData;
@end
