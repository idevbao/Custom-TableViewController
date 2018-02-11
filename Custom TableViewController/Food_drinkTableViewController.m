//
//  Food_drinkTableViewController.m
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Food_drinkTableViewController.h"

@interface Food_drinkTableViewController ()
@end

@implementation Food_drinkTableViewController
Food_drink_hotCell*cell;

NSMutableArray  * Product;
float  result;

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   }
-(void)loadView{
    [super loadView];
    _mArrayProduct  = [NSMutableArray new];
    _mArrayCategoryMilk = [NSMutableArray new];
    _mArrayCategoryTea = [NSMutableArray new];
    _mArrayCategoryCoffee = [NSMutableArray new];
}

- (void)viewDidLoad {
    [super viewDidLoad];


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
    myData * mydata7 =[[myData alloc] initmyDataNameVi:@"LATTE ĐÁ" NameKr:@"LATTE"
                                               Product:@"MILK" andPrice:10.1];
    
    myData * mydata10=[[myData alloc] initmyDataNameVi:@"TRÀ MATCHA LATTE NÓNG" NameKr:@"TEA (Hot)"
                                               Product:@"TEA" andPrice:10.99];
    
    myData * mydata11=[[myData alloc] initmyDataNameVi:@"MATCHA MACCHIATO" NameKr:@"MACCHIATO"
                                               Product:@"TEA" andPrice:10.5];
    
    myData * mydata12=[[myData alloc] initmyDataNameVi:@"TRÀ MATCHA LATTE ĐÁ" NameKr:@"MATCHA LATTE "
                                               Product:@"TEA" andPrice:10.9];
    [_mArrayCategoryCoffee addObjectsFromArray:@[mydata,mydata1,mydata2,mydata3]];
    [_mArrayCategoryMilk addObjectsFromArray:@[mydata5,mydata7]];
    [_mArrayCategoryTea addObjectsFromArray:@[mydata10,mydata11,mydata12]];
    [_mArrayProduct addObjectsFromArray:@[_mArrayCategoryTea ,_mArrayCategoryMilk,_mArrayCategoryCoffee]];
    
#pragma mark -Autolayout:
    
    UIButton * pay = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, 50, 50)];
    pay.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:pay];
    [pay addTarget:self action:@selector(Pay:) forControlEvents:UIControlEventTouchDown];
    //    pay.translatesAutoresizingMaskIntoConstraints = YES;
    //    [pay.centerXAnchor constraintEqualToAnchor:self.tableView.centerXAnchor constant:0].active = YES;
    //    [pay.centerYAnchor constraintEqualToAnchor:self.tableView.centerYAnchor constant:0].active = YES;
    //    //        [pay.topAnchor constraintEqualToAnchor:self.navigationController.navigationBar.topAnchor constant:10].active = YES;
    //            [pay.widthAnchor constraintEqualToAnchor:self.tableView.widthAnchor multiplier:0.5].active = YES;
    //            [pay.heightAnchor constraintEqualToAnchor:self.tableView.widthAnchor multiplier:0.5].active = YES;
    //
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

// khi làm việc với tableview add vào vỉewCtr thì phải cho biết các hàm của <UITableViewDelegate, UITableViewDataSource> được dùng ở đâu. phải khai báo protocol cho vỉewCtr
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell = (Food_drink_hotCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    // va kiem tra da ton tai chua
    Product =   [_mArrayProduct objectAtIndex:indexPath.section];
    if (cell == nil) {// vung ton bo nho
        cell =[[Food_drink_hotCell alloc]init_cell:self];
    }
    NSString * Category = ((myData*)[Product objectAtIndex:indexPath.row]).nameVi;
    NSString * CategoryVi = ((myData*)[Product objectAtIndex:indexPath.row]).nameVi;
    NSString * CategoryKr = ((myData*)[Product objectAtIndex:indexPath.row]).nameKr;
    float  CategoryPrice = ((myData*)[Product objectAtIndex:indexPath.row]).price;
    int QuantityCategory =  ((myData*)[Product objectAtIndex:indexPath.row]).quantity;
    //    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",Category]];
    //// paint img len context
    //    [cell.imageView.image drawInRect:CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, self.view.frame.size.width/2, self.tableView.rowHeight -2)];
    //    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
#pragma  mark
    UIImage * imgCategory = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",Category]];
    cell.imgViewCategory  = [cell.imgViewCategory initWithImage:imgCategory ];
    
    cell.lblNameCategoryVi.text = CategoryVi;
    cell.lblNameCategoryKr.text = CategoryKr;
    cell.lblPrice.text = [NSString stringWithFormat:@"%0.2f",CategoryPrice];
    cell.lblQuantityCategory.text = [NSString stringWithFormat:@"%d",QuantityCategory];
    cell.QuantityCategory = QuantityCategory;
    cell.mydata = [Product objectAtIndex:indexPath.row];
    [cell.textLabel setTextColor:[UIColor greenColor]];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
                                 NSLog(@"%fssss",data.totals);
                            }
                         }
                        
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
    return cell.heightRow;
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