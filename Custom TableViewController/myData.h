//
//  myData.h
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 05/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myData : NSObject
@property(nonatomic, strong) NSString* nameVi;
@property(nonatomic, strong) NSString* nameKr;
@property(nonatomic, strong) NSString* product;
@property(nonatomic, assign) float price;
@property(nonatomic, assign) int quantity;
@property(nonatomic,assign) float totals;

-(instancetype)initmyDataNameVi:(NSString *)nameVi NameKr:(NSString *)nameKr Product:(NSString*)product andPrice:(float)pric;

@end
