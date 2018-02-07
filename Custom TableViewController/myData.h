//
//  myData.h
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 05/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myData : NSObject
@property(nonatomic, strong) NSString* name_Vi;
@property(nonatomic, strong) NSString* name_Kr;
@property(nonatomic, assign) float price;
@property(nonatomic, assign) float quantity;

-(instancetype)initmyDataName_vi:(NSString*)nameVi name_Kr:(NSString*)nameKr andPrice:(float)price;

@end
