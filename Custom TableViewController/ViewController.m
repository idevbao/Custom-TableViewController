//
//  ViewController.m
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@protocol Passdata;

@interface ViewController ()

@end

@implementation ViewController
UITextField * txtVi, *txtkr,*txtpr;
TableViewController *tablevc;
-(void)loadView{
    [super loadView];
    _Datas = [NSMutableDictionary new];
    tablevc = [TableViewController new];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    

    txtVi = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:txtVi];
    txtVi.backgroundColor = [UIColor orangeColor];
    txtkr = [[UITextField alloc] initWithFrame:CGRectMake(100, 160, 100, 50)];
    [self.view addSubview:txtkr];
    txtkr.backgroundColor = [UIColor blueColor];
    txtpr = [[UITextField alloc] initWithFrame:CGRectMake(210, 160, 100, 50)];
    [self.view addSubview:txtpr];
    txtpr.backgroundColor = [UIColor greenColor];
    
    
    
    UIButton * btadd = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 100, 50)];
    btadd.backgroundColor = [UIColor redColor];
    [self.view addSubview:btadd];
    [btadd addTarget:self action:@selector(btadd:) forControlEvents:UIControlEventTouchDown];

    UIButton * btshow = [[UIButton alloc] initWithFrame:CGRectMake(210, 250, 100, 50)];
    btshow.backgroundColor = [UIColor brownColor];
    [self.view addSubview:btshow];
    [btshow addTarget:self action:@selector(btshow:) forControlEvents:UIControlEventTouchDown];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btpush = [[UIButton alloc] initWithFrame:CGRectMake(310, 350, 100, 50)];
    btpush.backgroundColor = [UIColor blackColor];
    [self.view addSubview:btpush];
    [btpush addTarget:self action:@selector(buttonActionPush:) forControlEvents:UIControlEventTouchDown];


}
-(void)btadd:(UIButton*)bt{
    myData * inData = [[myData alloc] initmyDataName_vi:txtVi.text name_Kr:txtkr.text andPrice:[txtpr.text integerValue]];
    
    [_Datas setObject:inData forKey:inData.name_Vi];
    NSLog(@"add");
}

-(void)btshow:(UIButton*)bt{
    NSLog(@"%@",((myData*)[_Datas objectForKey:txtVi.text]).name_Kr);
    NSLog(@"show");
}
- (void)buttonActionPush:(UIButton*)sender{
    TableViewController *objHomeVC = [[TableViewController alloc] init];
    [self.navigationController pushViewController:objHomeVC animated:YES];
    [_delegate pass_data_toTableView:_Datas];

}

@end
