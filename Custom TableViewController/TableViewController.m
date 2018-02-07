//
//  TableViewController.m
//  Core_TableVCtr
//
//  Created by Trúc Phương >_< on 02/02/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
@protocol Passdata;
@interface TableViewController ()
@end

@implementation TableViewController
Cell*cell;
NSTimer * timer;
CGFloat heightRow;
CGFloat widthRow;
UILabel *lblTemp;
UILabel *lblTemp1;
-(void)loadView{
    [super loadView];
    _mArrayProduct  = [NSMutableArray new];
    _mArrayCategoryMilk = [NSMutableArray new];
    _mArrayCategoryTea = [NSMutableArray new];
    _mArrayCategoryCoffee = [NSMutableArray new];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    myData * mydata =  [[myData alloc] initmyDataName_vi:@"Coffee 1" name_Kr:@"Coffee" andPrice:10];
    myData * mydata1 = [[myData alloc] initmyDataName_vi:@"Coffee 2" name_Kr:@"Coffee" andPrice:12];
    myData * mydata2 = [[myData alloc] initmyDataName_vi:@"Coffee 3" name_Kr:@"Coffee" andPrice:19];
    myData * mydata3 = [[myData alloc] initmyDataName_vi:@"Coffee 4" name_Kr:@"Coffee" andPrice:99];
    myData * mydata5 = [[myData alloc] initmyDataName_vi:@"MILK 1" name_Kr:@"MILK" andPrice:10];
    myData * mydata7 = [[myData alloc] initmyDataName_vi:@"MILK 3" name_Kr:@"MILK" andPrice:18];
    myData * mydata10= [[myData alloc] initmyDataName_vi:@"TEA 1" name_Kr:@"TEA" andPrice:13];
    myData * mydata11= [[myData alloc] initmyDataName_vi:@"TEA 2" name_Kr:@"TEA" andPrice:18];
    myData * mydata12= [[myData alloc] initmyDataName_vi:@"TEA 3" name_Kr:@"TEA" andPrice:14];
    [_mArrayCategoryCoffee addObject:mydata];
    [_mArrayCategoryCoffee addObject:mydata2];
    [_mArrayCategoryCoffee addObject:mydata3];
    [_mArrayCategoryCoffee addObject:mydata1];
    
    [_mArrayCategoryMilk addObject:mydata5];
    [_mArrayCategoryMilk addObject:mydata7];
    
    [_mArrayCategoryTea addObject:mydata10];
    [_mArrayCategoryTea addObject:mydata11];
    [_mArrayCategoryTea addObject:mydata12];
    
    [_mArrayProduct addObject:_mArrayCategoryTea];
    [_mArrayProduct addObject:_mArrayCategoryMilk];
    [_mArrayProduct addObject:_mArrayCategoryCoffee];
    
#pragma mark -Autolayout:
    
    heightRow = (self.view.frame.size.height- (2.8)*self.navigationController.navigationBar.frame.size.height )/5;
    widthRow = self.view.frame.size.width;
//    self.view.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:0].active = YES;
//    [v.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10].active = YES;
//    [v.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.5].active = YES;
//    [v.heightAnchor constraintEqualToAnchor:v.widthAnchor multiplier:0.5].active = YES;
    
    
    
    
    
    

    
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
    NSMutableArray  * row_ofSection =   [_mArrayProduct objectAtIndex:section];
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
    cell = (Cell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    // va kiem tra da ton tai chua
    if (cell == nil) {// vung ton bo nho
        cell =[[Cell alloc]init_cell];
       
    }
    
    NSMutableArray  * Product =   [_mArrayProduct objectAtIndex:indexPath.section];
    cell.textLabel.text = ((myData*)[Product objectAtIndex:indexPath.row]).name_Vi;
    
    NSString * Category = ((myData*)[Product objectAtIndex:indexPath.row]).name_Vi;
    
//    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",Category]];
//// paint img len context
//    [cell.imageView.image drawInRect:CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, self.view.frame.size.width/2, self.tableView.rowHeight -2)];
//    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
#pragma  mark

    
    
    UIImage * imgCategory = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",Category]];
    cell.imageView.image = imgCategory;
//    UIImageView *viewImgCategory= [[UIImageView alloc] initWithImage:imgCategory];
//    viewImgCategory.frame = CGRectMake(00, 0, self.view.frame.size.width/3, heightRow-10);
//    viewImgCategory.center = CGPointMake(self.view.frame.size.width/5, heightRow/2);
//    [cell addSubview:viewImgCategory];
    
    
    
    CGRect lbl1Frame = CGRectMake(100, 0, 140, 25);
    lblTemp = [[UILabel alloc] initWithFrame:lbl1Frame];;
    [lblTemp setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
    lblTemp.tag = 1;
    lblTemp.backgroundColor=[UIColor redColor];
    lblTemp.numberOfLines=0;
    [cell.contentView addSubview:lblTemp];
    
    [cell.textLabel setTextColor:[UIColor greenColor]];
    cell.backgroundColor = [UIColor whiteColor];
    

    return cell;
}
#pragma mark - @optional
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray  * row_ofSection =   [_mArrayProduct objectAtIndex:indexPath.section];
    myData* mData = [row_ofSection objectAtIndex:indexPath.row];
    
    cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    NSIndexPath* rowToReload = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    NSArray* rowsToReload = [NSArray arrayWithObjects:rowToReload, nil];
    [tableView reloadRowsAtIndexPaths:rowsToReload withRowAnimation:UITableViewRowAnimationNone];
    
    NSLog(@"%f", mData.price);
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

#pragma mark  Display customization
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSMutableArray  * row_ofSection =   [_mArrayProduct objectAtIndex:section];
    
    return ((myData*)[row_ofSection objectAtIndex:section]).name_Kr;
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = [UIColor grayColor];
    [((UITableViewHeaderFooterView *)view).textLabel setTextColor:[UIColor whiteColor]];
}
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return heightRow;
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