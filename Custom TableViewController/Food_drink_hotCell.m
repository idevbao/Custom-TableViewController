//
//  Food_drink_hotCell.m
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Food_drink_hotCell.h"

@implementation Food_drink_hotCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
-(instancetype)init_cell:(UITableViewController*)table{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
#pragma custom Cell
    UIViewController *vController = [UIApplication sharedApplication].keyWindow.rootViewController;

    CGFloat naviHeight = table.navigationController.navigationBar.frame.size.height;
    _heightRow = (vController.view.frame.size.height -([UIApplication sharedApplication].statusBarFrame.size.height)- naviHeight)/5.95;
    _widthRow = vController.view.frame.size.width;
    float padding =_widthRow*1/35;
#pragma mark - lbl
    _lblNameCategoryVi = [[UILabel alloc] initWithFrame:CGRectMake(_widthRow/3.3,padding,(_widthRow/1.48),(_heightRow/4)-padding)];
    _lblNameCategoryVi.backgroundColor = [UIColor clearColor];
    _lblNameCategoryVi.textAlignment = NSTextAlignmentLeft;
    _lblNameCategoryVi.font = [UIFont fontWithName:@"" size:14];
    _lblNameCategoryVi.textColor = [UIColor orangeColor];
    [self addSubview:_lblNameCategoryVi];
    
    _lblNameCategoryKr = [[UILabel alloc] initWithFrame:CGRectMake(_widthRow/3.3,_heightRow/4,(_widthRow/1.5),(_heightRow/4)-padding)];
    _lblNameCategoryKr.backgroundColor = [UIColor clearColor];
    _lblNameCategoryKr.textAlignment = NSTextAlignmentLeft;
    _lblNameCategoryKr.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:12];
    _lblNameCategoryKr.textColor = [UIColor grayColor];
    [self addSubview:_lblNameCategoryKr];
    
    _lblPrice = [[UILabel alloc] initWithFrame:CGRectMake(_widthRow/3.3,(_heightRow/2),(_widthRow/5.5),(_heightRow/4)-padding)];
    _lblPrice.backgroundColor = [UIColor clearColor];
    _lblPrice.textAlignment = NSTextAlignmentLeft;
    _lblPrice.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:12];
    _lblPrice.textColor = [UIColor orangeColor];
    [self addSubview:_lblPrice];
    
    _lblQuantityCategory = [[UILabel alloc] initWithFrame:CGRectMake(_widthRow*8.25/10,_heightRow/2,_widthRow/15,(_widthRow/16))];
    _lblQuantityCategory.backgroundColor = [UIColor clearColor];
    _lblQuantityCategory.textAlignment = NSTextAlignmentCenter;
    _lblQuantityCategory.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
    _lblQuantityCategory.textColor = [UIColor orangeColor];
    _lblQuantityCategory.hidden = YES;
    _lblQuantityCategory.text = 0;
#pragma mark _data
    [self addSubview:_lblQuantityCategory];
#pragma mark - img
    _imgViewCategory = [[UIImageView alloc] initWithFrame:CGRectMake(padding,padding,_heightRow-(2*padding),_heightRow-(2*padding))];
    [self addSubview:_imgViewCategory];
    _imgViewCategory.contentMode  = UIViewContentModeScaleAspectFit;
    _imgViewCategory.backgroundColor = [UIColor grayColor];
    [self addBtn];
    return self;
}
-(void)addBtn{
#pragma mark -  add btn in view

    _QuantityCategory = [_lblQuantityCategory.text intValue];
    _PriceCategory = [_lblPrice.text intValue];
    //    btn add
    _btnOder= [[UIButton alloc]initWithFrame:CGRectMake(_widthRow*9/10,_heightRow/2,_widthRow/15,(_widthRow/16)) ];
    _btnOder.backgroundColor = [UIColor orangeColor];
    _btnOder.hidden = NO;
    [_btnOder setTitle:@"+" forState:UIControlStateNormal];
    [self addSubview:_btnOder];
    [_btnOder addTarget:self action:@selector(setBTAdd:) forControlEvents:UIControlEventTouchDown];
    //    btn -
    _btnTru= [[UIButton alloc]initWithFrame:CGRectMake(_widthRow*7.5/10,_heightRow/2,_widthRow/15,(_widthRow/16)) ];
    _btnTru.backgroundColor = [UIColor orangeColor];
    _btnTru.hidden = YES;
    [_btnTru setTitle:@"-" forState:UIControlStateNormal];
    [self addSubview:_btnTru];
    [_btnTru addTarget:self action:@selector(setBTNTru:) forControlEvents:UIControlEventTouchUpInside];
    //btn +
    _btnCong= [[UIButton alloc]initWithFrame:CGRectMake(_widthRow*9/10,_heightRow/2,_widthRow/15,(_widthRow/16))];
    _btnCong.backgroundColor = [UIColor orangeColor];
    _btnCong.hidden =YES;
    [_btnCong setTitle:@"+" forState:UIControlStateNormal];
    [self addSubview:_btnCong];
    [_btnCong addTarget:self action:@selector(setBTNCong:) forControlEvents:UIControlEventTouchDown];
}
-(void)setBTAdd:(UIButton*)btn{
    _QuantityCategory = 1;
    NSLog(@"%@",_mydata.nameVi);
    self.btnOder.hidden = YES;
    self.btnTru.hidden = NO;
    self.btnCong.hidden = NO;
    self.lblQuantityCategory.hidden = NO;
    self.mydata.quantity = self.QuantityCategory;
    self.lblQuantityCategory.text = [NSString stringWithFormat:@"%d",_mydata.quantity];
}
-(void)setBTNTru:(UIButton*)btn{
    NSLog(@"%@",_mydata.nameVi);
        _QuantityCategory --;
    if (_QuantityCategory < 1){
        _btnOder.hidden = NO;
        _btnTru.hidden = YES;
        _btnCong.hidden = YES;
        _lblQuantityCategory.hidden = YES;
    }
    _mydata.quantity = _QuantityCategory;
    _lblQuantityCategory.text = [NSString stringWithFormat:@"%d",_mydata.quantity];
}
-(void)setBTNCong:(UIButton*)btn{
    _QuantityCategory ++;
    _mydata.quantity = _QuantityCategory;
    _lblQuantityCategory.text = [NSString stringWithFormat:@"%d",_mydata.quantity];
}
@end
