//
//  HOT_ViewController.m
//  Custom TableViewController
//
//  Created by Trúc Phương >_< on 12/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//


#import "HOT_ViewController.h"

@interface HOT_ViewController ()

@end

@implementation HOT_ViewController
UITableView * tableviewHOT;
CellFood* cellHOT;
NSMutableArray  * Product_HOT;
float  result_HOT;


- (void)viewDidLoad {
    [super viewDidLoad];
    _mArrayProduct  = [NSMutableArray new];
    _mArrayCategoryMilk = [NSMutableArray new];
    _mArrayCategoryTea = [NSMutableArray new];
    _mArrayCategoryCoffee = [NSMutableArray new];
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
    [_mArrayCategoryCoffee addObjectsFromArray:@[mydata,mydata1,mydata2,mydata3,mydata5,mydata6,mydata7,mydata10,mydata11,mydata12]];
    [_mArrayProduct addObjectsFromArray:@[_mArrayCategoryCoffee]];
    
    tableviewHOT = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableviewHOT.dataSource = self;
    tableviewHOT.delegate = self;
    [self.view addSubview:tableviewHOT];
    
#pragma mark -Autolayout:
    
    UIButton * pay = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, 50, 50)];
    [pay setImage:[UIImage imageNamed:@"pay.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:pay];
    [pay addTarget:self action:@selector(Pay:) forControlEvents:UIControlEventTouchDown];
    
    
    // Do any additional setup after loading the view.
}


#pragma mark - protocol tableview
//  làm việc với 2 protocol UITableViewDelegate, UITableViewDataSource: data thì làm việc với dữ liệu  còn lại thì là tuỳ chỉnh custom cho tableview
#pragma mark - Table view data source : numberOfSectionsInTableView? numberOfRowsInSection? section?

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return (int)_mArrayProduct.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    NSMutableArray  * row_ofSection =  [_mArrayProduct objectAtIndex:section];
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
    cellHOT = (CellFood*)[tableView dequeueReusableCellWithIdentifier:@"CellFood"];
    // va kiem tra da ton tai chua
    Product_HOT=   [_mArrayProduct objectAtIndex:indexPath.section];
    if (cellHOT == nil) {// vung ton bo nho
        cellHOT =[[CellFood alloc]init_cell:self];
    }
    NSString * Category = ((myData*)[Product_HOT objectAtIndex:indexPath.row]).nameVi;
    NSString * CategoryVi = ((myData*)[Product_HOT objectAtIndex:indexPath.row]).nameVi;
    NSString * CategoryKr = ((myData*)[Product_HOT objectAtIndex:indexPath.row]).nameKr;
    float  CategoryPrice = ((myData*)[Product_HOT objectAtIndex:indexPath.row]).price;
    int QuantityCategory =  ((myData*)[Product_HOT objectAtIndex:indexPath.row]).quantity;
    //    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",Category]];
    //// paint img len context
    //    [cell.imageView.image drawInRect:CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, self.view.frame.size.width/2, self.tableView.rowHeight -2)];
    //    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
#pragma  mark
    UIImage * imgCategory = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",Category]];
    cellHOT.imgViewCategory  = [cellHOT.imgViewCategory initWithImage:imgCategory ];
    
    cellHOT.lblNameCategoryVi.text = CategoryVi;
    cellHOT.lblNameCategoryKr.text = CategoryKr;
    cellHOT.lblPrice.text = [NSString stringWithFormat:@"$%0.2f",CategoryPrice];
    cellHOT.lblQuantityCategory.text = [NSString stringWithFormat:@"%d",QuantityCategory];
    
    cellHOT.QuantityCategory = QuantityCategory;
    cellHOT.mydata = [Product_HOT objectAtIndex:indexPath.row];
    
    [cellHOT.textLabel setTextColor:[UIColor greenColor]];
    cellHOT.backgroundColor = [UIColor whiteColor];
    cellHOT.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cellHOT.mydata.quantity ==0) {
        cellHOT.btnCong.hidden =cellHOT.mydata.isBtn;
        cellHOT.btnTru.hidden =cellHOT.mydata.isBtn;
        cellHOT.btnOder.hidden =!cellHOT.mydata.isBtn;
        cellHOT.lblQuantityCategory.hidden =cellHOT.mydata.isBtn;
    }
    if (cellHOT.mydata.quantity >0) {
        cellHOT.btnCong.hidden =!cellHOT.mydata.isBtn;
        cellHOT.btnTru.hidden =!cellHOT.mydata.isBtn;
        cellHOT.btnOder.hidden =cellHOT.mydata.isBtn;
        cellHOT.lblQuantityCategory.hidden =!cellHOT.mydata.isBtn;
    }
    
    
    return cellHOT;
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
    for (int  i=0; i<_mArrayProduct.count; i++  ) {
        NSMutableArray * item = [_mArrayProduct objectAtIndex:i];
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
                         for (int  i=0; i<_mArrayProduct.count; i++  ) {
                             NSMutableArray * item = [_mArrayProduct objectAtIndex:i];
                             for (int y = 0;y<item.count; y++ ) {
                                 myData *data = [item objectAtIndex:y];
                                 data.quantity = 0;
                                 
                             }
                         }
                         [tableviewHOT reloadData];
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
    NSMutableArray * row_ofSection = [_mArrayProduct objectAtIndex:section];
    return ((myData*)[row_ofSection objectAtIndex:section]).product;
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = [UIColor brownColor];
    [((UITableViewHeaderFooterView *)view).textLabel setTextColor:[UIColor whiteColor]];
}
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHOT.heightRow;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    CGFloat naviHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat ta3 = self.tabBarController.tabBar.frame.size.height;
    
    CGFloat heightSection = (self.view.frame.size.height -([UIApplication sharedApplication].statusBarFrame.size.height)- naviHeight- ta3)/20;
    
    return heightSection;
}
/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end



