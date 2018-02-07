//
//  ViewController.h
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "myData.h"

@class TableViewController;
@protocol Passdata <NSObject>

-(void)pass_data_toTableView:(NSMutableDictionary*)_data;
@end

@interface ViewController : UIViewController{
 
}
@property(nonatomic, strong) NSMutableDictionary* Datas;
@property(nonatomic, strong) id<Passdata> delegate;


@end

