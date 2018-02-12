//
//  myData.m
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 05/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "myData.h"

@implementation myData
-(instancetype)initmyDataNameVi:(NSString *)nameVi NameKr:(NSString *)nameKr Product:(NSString*)product andPrice:(float)price{
    _nameVi = nameVi;
    _nameKr = nameKr;
    _price = price;
    _product = product;
    _quantity = 0;
    _isBtn = YES;
    return self;
}

@end
