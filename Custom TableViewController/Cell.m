//
//  Cell.m
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)init_cell{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    
#pragma custom Cell
    UIViewController *vController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    float padding =2;

    _heightRow = (vController.view.frame.size.height - 2*([UIApplication sharedApplication].statusBarFrame.size.height))/5.95;
    _widthRow = vController.view.frame.size.width;


    
#pragma mark - lbl
    _lblNameCategoryVi = [[UILabel alloc] initWithFrame:CGRectMake(padding+_widthRow/3,padding, (_widthRow/1.7), (_heightRow/4)-2*padding)];
    _lblNameCategoryVi.backgroundColor = [UIColor grayColor];
    _lblNameCategoryVi.textAlignment = NSTextAlignmentCenter;
    _lblNameCategoryVi.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
    _lblNameCategoryVi.textColor = [UIColor greenColor];
    [self addSubview:_lblNameCategoryVi];
    
    _lblNameCategoryKr = [[UILabel alloc] initWithFrame:CGRectMake(padding+_widthRow/2,_heightRow/4, (_widthRow/2.5), (_heightRow/4)-2*padding)];
    _lblNameCategoryKr.backgroundColor = [UIColor lightGrayColor];
    _lblNameCategoryKr.textAlignment = NSTextAlignmentRight;
    _lblNameCategoryKr.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
    _lblNameCategoryKr.textColor = [UIColor greenColor];
    [self addSubview:_lblNameCategoryKr];
    
    _lblPrice = [[UILabel alloc] initWithFrame:CGRectMake(padding+_widthRow*7/9,(_heightRow/2), (_widthRow/6), (_heightRow/4)-2*padding)];
    _lblPrice.backgroundColor = [UIColor orangeColor];
    _lblPrice.textAlignment = NSTextAlignmentCenter;
    _lblPrice.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:25];
    _lblPrice.textColor = [UIColor greenColor];
    [self addSubview:_lblPrice];
    
    
    _lblQuantityCategory = [[UILabel alloc] initWithFrame:CGRectMake(_widthRow*7/10,3*_heightRow/4, _widthRow/10, (_heightRow/4))];
    _lblQuantityCategory.backgroundColor = [UIColor grayColor];
    _lblQuantityCategory.textAlignment = NSTextAlignmentCenter;
    _lblQuantityCategory.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:25];
    _lblQuantityCategory.textColor = [UIColor whiteColor];
    _lblQuantityCategory.hidden = NO;
    
    _lblQuantityCategory.text = 0;
#pragma mark _data

    [self addSubview:_lblQuantityCategory];
#pragma mark - img
    _imgViewCategory = [[UIImageView alloc] initWithFrame:CGRectMake(padding, padding, (_widthRow)/2.5, _heightRow -2*padding)];
    [self addSubview:_imgViewCategory];
    
    _imgViewCategory.contentMode  = UIViewContentModeScaleAspectFit;
    
    
#pragma mark -  add btn in view
    
    _QuantityCategory = [_lblQuantityCategory.text intValue];
    _PriceCategory = [_lblPrice.text intValue];
    
    //btn add
//    _btnOder= [[UIButton alloc]initWithFrame:CGRectMake(_widthRow*7/10,3*_heightRow/4 , _widthRow/10, _heightRow/4) ];
//    _btnOder.backgroundColor = [UIColor greenColor];
//    _btnOder.hidden = NO;
//    [_btnOder setTitle:@"+" forState:UIControlStateNormal];
//    [self addSubview:_btnOder];
//    [_btnOder addTarget:self action:@selector(setBTAdd:) forControlEvents:UIControlEventTouchDown];
    //btn -
    _btnTru= [[UIButton alloc]initWithFrame:CGRectMake(_widthRow*6/10,3*_heightRow/4 , _widthRow/10, _heightRow/4) ];
    _btnTru.backgroundColor = [UIColor redColor];
    _btnTru.hidden = NO;
    [_btnTru setTitle:@"-" forState:UIControlStateNormal];
    [self addSubview:_btnTru];
    [_btnTru addTarget:self action:@selector(setBTNTru:) forControlEvents:UIControlEventTouchUpInside];
    //btn +
    _btnCong= [[UIButton alloc]initWithFrame:CGRectMake(_widthRow*8/10,3*_heightRow/4 , _widthRow/10, _heightRow/4) ];
    _btnCong.backgroundColor = [UIColor redColor];
    _btnCong.hidden =NO;
    
    [_btnCong setTitle:@"+" forState:UIControlStateNormal];
    [self addSubview:_btnCong];
    [_btnCong addTarget:self action:@selector(setBTNCong:) forControlEvents:UIControlEventTouchDown];
    return self;
}


//-(void)setBTAdd:(id)btn{
//    _QuantityCategory = 1;
//        NSLog(@"%@",_mydata.nameVi);
//
//   
//        _btnOder.hidden = YES;
//        _btnTru.hidden = NO;
//        _btnCong.hidden = NO;
//        _lblQuantityCategory.hidden = NO;
//
//  
//    _mydata.quantity = _QuantityCategory;
//    _lblQuantityCategory.text = [NSString stringWithFormat:@"%d",_mydata.quantity];
//
//    
//}

-(void)setBTNTru:(id)btn{
        NSLog(@"%@",_mydata.nameVi);


    
//    if (_QuantityCategory < 1) {
//        _btnOder.hidden = NO;
//        _btnTru.hidden = YES;
//        _btnCong.hidden = YES;
//        _lblQuantityCategory.hidden = YES;
//    }
    _QuantityCategory --;
    _mydata.quantity = _QuantityCategory;
    _lblQuantityCategory.text = [NSString stringWithFormat:@"%d",_mydata.quantity];


}
-(void)setBTNCong:(id)btn{
        NSLog(@"%@",_mydata.nameVi);
//    if (_QuantityCategory < 1) {
//        _btnOder.hidden = NO;
//        _btnTru.hidden = YES;
//        _btnCong.hidden = YES;
//        _lblQuantityCategory.hidden = YES;
//    }
    _QuantityCategory ++;
    _mydata.quantity = _QuantityCategory;
    _lblQuantityCategory.text = [NSString stringWithFormat:@"%d",_mydata.quantity];

}



@end
