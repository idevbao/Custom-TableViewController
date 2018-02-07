//
//  myData.m
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 05/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "myData.h"

@implementation myData
-(instancetype)initmyDataName_vi:(NSString *)nameVi name_Kr:(NSString *)nameKr andPrice:(float)price{
        _name_Vi = nameVi;
        _name_Kr = nameKr;
        _price = price;
    return self;
}

@end
