//
//  FOOD_ViewController.m
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 11/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "FOOD_ViewController.h"

@interface FOOD_ViewController ()


@end

@implementation FOOD_ViewController
UITableView * tableview;
CellFood* cellFood;
NSMutableArray  * Product_Food;
float  result_Food;
UIView *viewPayShow;
FoodScroll * foodScroll;

UIPageControl * PControl;

DataManager *dataManager;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    CGFloat naviHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat ta3 = self.tabBarController.tabBar.frame.size.height;
    
    CGFloat height = (self.view.frame.size.height -([UIApplication sharedApplication].statusBarFrame.size.height)- naviHeight- ta3);
    CGFloat heightSection = height/20;
    _heightFood = (height -heightSection)/4;
    
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark DataManager
    dataManager = [DataManager getData];

#pragma mark Tableview
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, _heightFood, self.view.frame.size.width, self.view.frame.size.height)];
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];
    
#pragma mark -foodScroll:
    
    foodScroll = [[FoodScroll alloc]initFoodScroll:12 withHeight:_heightFood  andWidth:self.view.frame.size.width view:self];
    [self.view addSubview:foodScroll];
    foodScroll.delegate= self;
#pragma mark -UIPageControl:
    
    PControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, ([UIApplication sharedApplication].statusBarFrame.size.height)+ naviHeight, self.view.frame.size.width, 20)];
    PControl.numberOfPages =4;
    PControl.backgroundColor = [UIColor grayColor];
    [PControl addTarget:self action:@selector(onPCchange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:PControl];
    
    
#pragma mark -pay:
    
    UIButton * pay = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, 50, 50)];
    [pay setImage:[UIImage imageNamed:@"pay.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:pay];
    [pay addTarget:self action:@selector(Pay:) forControlEvents:UIControlEventTouchDown];
#pragma mark -payShow:
    viewPayShow = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    viewPayShow.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    viewPayShow.backgroundColor = [UIColor whiteColor];
    viewPayShow.alpha = 0.5;
    viewPayShow.hidden = YES;
    [self.view addSubview:viewPayShow];
}


#pragma mark - protocol tableview
//  làm việc với 2 protocol UITableViewDelegate, UITableViewDataSource: data thì làm việc với dữ liệu  còn lại thì là tuỳ chỉnh custom cho tableview
#pragma mark - Table view data source : numberOfSectionsInTableView? numberOfRowsInSection? section?

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return (int)dataManager.mArrayProduct.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    NSMutableArray  * row_ofSection =  [dataManager.mArrayProduct objectAtIndex:section];
    return row_ofSection.count;
}

#pragma mark - cellForRowAtIndexPath : Working Content in Row
//  chọn Content ở Row thứ mấy? Section thư mấy?
//  lặp lại theo số Dòng Row -> ^
//  ở đây 1 Section dạng Plain -> return số dòng:
//  ở đây là Section = 0 ; row = 0->9
//  cell: Content nằm trong Row
//  indexpath vị trí Cell
//  cơ chế các cell giống nhau được lưu vào bộ nhớ vùng Stack không cần khởi tạo lại vì việc kéo thả tableview -> vẽ các row làm tốn bộ nhớ : alloc
//  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dinhdanh"]; -> luu lai voi 1 dinh danh

// Indexpath ở đây có .row .section : lấy đc giá trị của section và row của tableview
#pragma mark - @required
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#pragma mark - init Cell
    // method này thì luôn trả về cell và được size phù hợp do đã đăng kí cell nạp style và identifier cho cell bằng code hoặc thêm trên xib :     [self.tableView registerClass:[Cell class] forCellReuseIdentifier:@"Cell"];
    // cell = (Cell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one. : return Cell có thể bị nil bắt buộc dùng if để tạo Style: Cell reuseIdentifier: đặc danh cho cell
    // Gọi cell bằng phương thức định danh nếu chưa có thì khởi tạo tránh tạo nhiều khi kéo thả tableview
    cellFood = (CellFood*)[tableView dequeueReusableCellWithIdentifier:@"CellFood"];
    // va kiem tra da ton tai chua
    Product_Food=   [dataManager.mArrayProduct objectAtIndex:indexPath.section];
    if (cellFood == nil) {// vung ton bo nho
        cellFood =[[CellFood alloc]init_cell:self];
    }
    NSString * Category = ((myData*)[Product_Food objectAtIndex:indexPath.row]).nameVi;
    NSString * CategoryVi = ((myData*)[Product_Food objectAtIndex:indexPath.row]).nameVi;
    NSString * CategoryKr = ((myData*)[Product_Food objectAtIndex:indexPath.row]).nameKr;
    float  CategoryPrice = ((myData*)[Product_Food objectAtIndex:indexPath.row]).price;
    int QuantityCategory =  ((myData*)[Product_Food objectAtIndex:indexPath.row]).quantity;
    //    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",Category]];
    //// paint img len context
    //    [cell.imageView.image drawInRect:CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, self.view.frame.size.width/2, self.tableView.rowHeight -2)];
    //    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
#pragma  mark
    UIImage * imgCategory = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",Category]];
    cellFood.imgViewCategory  = [cellFood.imgViewCategory initWithImage:imgCategory ];
    
    cellFood.lblNameCategoryVi.text = CategoryVi;
    cellFood.lblNameCategoryKr.text = CategoryKr;
    cellFood.lblPrice.text = [NSString stringWithFormat:@"$%0.2f",CategoryPrice];
    cellFood.lblQuantityCategory.text = [NSString stringWithFormat:@"%d",QuantityCategory];
    
    cellFood.QuantityCategory = QuantityCategory;
    cellFood.mydata = [Product_Food objectAtIndex:indexPath.row];
    
    [cellFood.textLabel setTextColor:[UIColor greenColor]];
    cellFood.backgroundColor = [UIColor whiteColor];
    cellFood.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cellFood.mydata.quantity ==0) {
        cellFood.btnCong.hidden =cellFood.mydata.isBtn;
        cellFood.btnTru.hidden =cellFood.mydata.isBtn;
        cellFood.btnOder.hidden =!cellFood.mydata.isBtn;
        cellFood.lblQuantityCategory.hidden =cellFood.mydata.isBtn;
    }
    if (cellFood.mydata.quantity >0) {
        cellFood.btnCong.hidden =!cellFood.mydata.isBtn;
        cellFood.btnTru.hidden =!cellFood.mydata.isBtn;
        cellFood.btnOder.hidden =cellFood.mydata.isBtn;
        cellFood.lblQuantityCategory.hidden =!cellFood.mydata.isBtn;
    }
    return cellFood;
}
#pragma mark - @optional
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

-(void)Pay:(UIButton*)bt{
    float s=0;
    NSString * title = @"";
    UIAlertAction* yesButton;
    UIAlertAction* noButton;
    for (int  i=0; i<dataManager.mArrayProduct.count; i++  ) {
        NSMutableArray * item = [dataManager.mArrayProduct objectAtIndex:i];
        for (int y = 0;y<item.count; y++ ) {
            myData *data = [item objectAtIndex:y];
            data.totals = data.quantity* data.price;
            NSLog(@"%f",data.totals);
            s+=data.totals;
        }
    }
    if (s > 0) {
        yesButton = [UIAlertAction
                     actionWithTitle:@"Thanh toán!"
                     style:UIAlertActionStyleDestructive
                     handler:^(UIAlertAction * action) {
                         for (int  i=0; i<dataManager.mArrayProduct.count; i++  ) {
                             NSMutableArray * item = [dataManager.mArrayProduct objectAtIndex:i];
                             for (int y = 0;y<item.count; y++ ) {
                                 myData *data = [item objectAtIndex:y];
                                 data.quantity = 0;
                             }
                         }
                         [tableview reloadData];
                         NSLog(@"thành tiền: %0.2f",s);
                     }];
        noButton = [UIAlertAction
                    actionWithTitle:@"Cancel"
                    style:UIAlertActionStyleCancel
                    handler:^(UIAlertAction * action) {
                    }];
        title = [NSString stringWithFormat:@"Bạn muốn thanh toán: $%0.2f",s];

    }
    if (s==0){
        title =@"Bạn chưa Oder vui lòng chọn món!";
        noButton = [UIAlertAction
                    actionWithTitle:@"Oder"
                    style:UIAlertActionStyleCancel
                    handler:^(UIAlertAction * action) {
                    }];
    }
        UIAlertController * alertShow = [UIAlertController alertControllerWithTitle:@"The LADOcoffee" message:title preferredStyle:UIAlertControllerStyleActionSheet];
    
        if (s > 0) {
            [alertShow addAction:yesButton];
            [alertShow addAction:noButton];
        }
        if (s==0) {
            [alertShow addAction:noButton];
        }
        [self presentViewController:alertShow animated:YES completion:nil];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

#pragma mark  Display customization
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSMutableArray * row_ofSection = [dataManager.mArrayProduct objectAtIndex:section];
    return ((myData*)[row_ofSection objectAtIndex:section]).product;
    
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    
    [((UITableViewHeaderFooterView *)view).textLabel setTextColor:[UIColor blackColor]];
}
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellFood.heightRow;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    CGFloat naviHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat ta3 = self.tabBarController.tabBar.frame.size.height;
    
    CGFloat heightSection = (self.view.frame.size.height -([UIApplication sharedApplication].statusBarFrame.size.height)- naviHeight- ta3)/20;
    
    return heightSection;
}


-(void)onPCchange:(id)sender{
    foodScroll.contentOffset = CGPointMake(PControl.currentPage* self.view.frame.size.width, 0);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    PControl.currentPage =foodScroll.contentOffset.x/self.view.frame.size.width;
 
}
@end


