//
//  Cell.h
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myData.h"

@interface Cell : UITableViewCell
@property (nonatomic,strong)UILabel*lblNameCategoryVi;
@property (nonatomic,strong)UILabel*lblNameCategoryKr;
@property (nonatomic,strong)UILabel*lblPrice;
@property (nonatomic,strong)UIImageView*imgViewCategory;
@property (nonatomic,strong)UILabel*lblQuantityCategory;


@property (nonatomic,strong)UIButton*btnOder;
@property (nonatomic,strong)UIButton*btnTru;
@property (nonatomic,strong)UIButton*btnCong;


@property (nonatomic,assign)int QuantityCategory;
@property (nonatomic,assign)float PriceCategory;
@property (nonatomic,assign)CGFloat heightRow;
@property (nonatomic,assign)CGFloat widthRow;

@property (nonatomic,strong)myData * mydata;
-(instancetype)init_cell:(UITableViewController*)table;
@end
