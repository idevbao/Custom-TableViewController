//
//  DataManagerHot.m
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 13/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "DataManagerHot.h"

@implementation DataManagerHot


+(instancetype)getData{
    static DataManagerHot* DataManagerHot = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce,^{
        
        DataManagerHot = [self new];
        DataManagerHot.mArrayProduct  = [NSMutableArray new];
        DataManagerHot.mArrayCategoryHOT = [NSMutableArray new];

        
        myData * mydata = [[myData alloc] initmyDataNameVi:@"CAPPUCINO NÓNG" NameKr:@"Cappucino (Hot)"
                                                   Product:@"Coffee" andPrice:10.5];
        myData * mydata1 =[[myData alloc] initmyDataNameVi:@"AMERICANO NÓNG" NameKr:@"Espresso (Hot)"
                                                   Product:@"Coffee" andPrice:8.9];
        myData * mydata2 =[[myData alloc] initmyDataNameVi:@"CARAMEL MACHIATO NÓNG" NameKr:@"Espresso, milk, caramel"
                                                   Product:@"Coffee" andPrice:18.5];
        myData * mydata3 =[[myData alloc] initmyDataNameVi:@"ESPRESSO SỮA NÓNG" NameKr:@"ESPRESSO (Hot)"
                                                   Product:@"Coffee" andPrice:21.9];
        
        myData * mydata5 =[[myData alloc] initmyDataNameVi:@"MOCHA ĐÁ XAY" NameKr:@"Espresso, milk, socola"
                                                   Product:@"MILK" andPrice:10];
        myData * mydata6 =[[myData alloc] initmyDataNameVi:@"Chocolate" NameKr:@"Chocolate"
                                                   Product:@"MILK" andPrice:10.1];
        myData * mydata7 =[[myData alloc] initmyDataNameVi:@"LATTE ĐÁ" NameKr:@"LATTE"
                                                   Product:@"MILK" andPrice:10.1];
        
        
        myData * mydata10=[[myData alloc] initmyDataNameVi:@"TRÀ MATCHA LATTE NÓNG" NameKr:@"TEA (Hot)"
                                                   Product:@"TEA" andPrice:10.99];
        
        myData * mydata11=[[myData alloc] initmyDataNameVi:@"MATCHA MACCHIATO" NameKr:@"MACCHIATO"
                                                   Product:@"TEA" andPrice:10.5];
        
        myData * mydata12=[[myData alloc] initmyDataNameVi:@"TRÀ MATCHA LATTE ĐÁ" NameKr:@"MATCHA LATTE "
                                                   Product:@"TEA" andPrice:10.9];
        [DataManagerHot.mArrayCategoryHOT addObjectsFromArray:@[mydata,mydata1,mydata2,mydata3,mydata5,mydata6,mydata7,mydata10,mydata11,mydata12]];
        [DataManagerHot.mArrayProduct addObjectsFromArray:@[DataManagerHot.mArrayCategoryHOT]];
        
        
        
    });
    
    return DataManagerHot;
}
@end
