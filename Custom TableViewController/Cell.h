//
//  Cell.h
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell{
UILabel*lbl_table_food;
UILabel*lbl_title_food;

UILabel*lbl_money_food;
UIView*view_table_food;

UIButton*btn_table_food;
UIButton*btn_tru;
UIButton*btn_cong;

UILabel*lbl_Coutn;


UIImageView*imgview_table_food;
}
@property (nonatomic,assign)int countSL;
@property (nonatomic,assign)float total;
@property (nonatomic,assign)float money;

-(instancetype)init_cell;
@end
