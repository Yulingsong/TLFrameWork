//
//  TLSearchBarController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLSearchBarController.h"
#import "TLCarModel.h"


@interface TLSearchBarController()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
///** array */
//@property (nonatomic,strong) NSArray *array;
///** search */
//@property (nonatomic,strong) UISearchBar *search;
///** UISearchDisplayController */
//@property (nonatomic,strong) UISearchController *searchController;
///* result */
//@property (nonatomic, strong) NSMutableArray *searchResults;
///** table */
//@property (nonatomic,strong) UITableView *tableView;
///** arrat */
//@property (nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong)NSMutableArray *resultArray;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation TLSearchBarController

-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [TLCarModel demoData];
    }
    return _dataArray;
    
}
-(NSMutableArray *)resultArray{
    
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:TLRect(0, 0, 1, 603/667)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.rowHeight = 44;
        _tableView.layer.cornerRadius = 5;
        _tableView.tableHeaderView = [self headView];
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

//UISearchBar作为tableview的头部
-(UIView *)headView{
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 100, 44)];
    searchBar.keyboardType = UIKeyboardAppearanceDefault;
    searchBar.placeholder = @"请输入搜索关键字";
    searchBar.delegate = self;
    //底部的颜色
    searchBar.barTintColor = [UIColor grayColor];
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    searchBar.barStyle = UIBarStyleDefault;
    return searchBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self prefersStatusBarHidden];
    
    
    [self.resultArray addObjectsFromArray:self.dataArray];
    [self.view addSubview:self.tableView];
}


#pragma mark-searchBarDelegate

//在搜索框中修改搜索内容时，自动触发下面的方法
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    NSLog(@"开始输入搜索内容");
    searchBar.showsCancelButton = YES;//取消的字体颜色，
    [searchBar setShowsCancelButton:YES animated:YES];
    
    //改变取消的文本
    for(UIView *view in [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"输入搜索内容完毕");
}

//搜框中输入关键字的事件响应
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    NSLog(@"输入的关键字是---%@---%lu",searchText,(unsigned long)searchText.length);
    
    //需要事先情况存放搜索结果的数组
    [self.resultArray removeAllObjects];
    
    
    //加个多线程，否则数量量大的时候，有明显的卡顿现象
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_async(globalQueue, ^{
        if (searchText!=nil && searchText.length>0) {
            
            //遍历需要搜索的所有内容，其中self.dataArray为存放总数据的数组
            for (TLCarModel *model in self.dataArray) {
                
                NSString *tempStr = model.content;
                
                //----------->把所有的搜索结果转成成拼音
                NSString *pinyin = [self transformToPinyin:tempStr];
                NSLog(@"pinyin--%@",pinyin);
                
                if ([pinyin rangeOfString:searchText options:NSCaseInsensitiveSearch].length >0 ) {
                    //把搜索结果存放self.resultArray数组
                    [self.resultArray addObject:model];
                }
            }
            
        }else{
            
            self.resultArray = [NSMutableArray arrayWithArray:self.dataArray];
        }
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
        });
    });
}

//取消的响应事件
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@"取消搜索");
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

//键盘上搜索事件的响应
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@"搜索");
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

#pragma mark--获取汉字转成拼音字符串 通讯录模糊搜索 支持拼音检索 首字母 全拼 汉字 搜索
- (NSString *)transformToPinyin:(NSString *)aString{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    int count = 0;
    
    for (int  i = 0; i < pinyinArray.count; i++)
    {
        
        for(int i = 0; i < pinyinArray.count;i++)
        {
            if (i == count) {
                [allString appendString:@"#"];//区分第几个字母
            }
            [allString appendFormat:@"%@",pinyinArray[i]];
            
        }
        [allString appendString:@","];
        count ++;
        
    }
    
    NSMutableString *initialStr = [NSMutableString new];//拼音首字母
    
    for (NSString *s in pinyinArray)
    {
        if (s.length > 0)
        {
            
            [initialStr appendString:  [s substringToIndex:1]];
        }
    }
    
    [allString appendFormat:@"#%@",initialStr];
    [allString appendFormat:@",#%@",aString];
    
    return allString;
}

#pragma mark -- tableViewDataSouce
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.resultArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    TLCarModel *model = self.resultArray[indexPath.row];
    
    //关键字高亮
    //    if (_keyword) {
    //
    //        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:model.content];
    //        NSRange range = [model.content rangeOfString:_keyword];
    //        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]range:range];
    //
    //        cell.textLabel.attributedText = attr;
    //
    //    }else{
    
    cell.textLabel.text = model.content;
    // }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








//-(NSArray *)dataArray{
//    if (!_dataArray) {
//        _dataArray = [TLCarModel demoData];
//    }
//    return _dataArray;
//    
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
//    [super viewWillDisappear:animated];
//}
////懒加载
//-(NSArray *)array
//{
//    if (!_array)
//    {
//        _array = [NSArray array];
//    }
//    return _array;
//}
//-(NSMutableArray *)searchResults
//{
//    if (!_searchResults)
//    {
//        _searchResults = [NSMutableArray array];
//    }
//    return _searchResults;
//}
//
//-(void)viewDidLoad
//{
//    self.title = @"Search Bar";
//    self.view.backgroundColor = TLMainBackColor;
//    self.array = [NSArray arrayWithObjects:@"Acura",@"Audi",@"BMW",@"Cadillac",@"Chevrolet",@"Chrysler",@"Dodge",@"Ferrari",@"Ford",@"GMC",@"Honda",@"Hunmmer",@"Hyundai",@"Indiniti",@"Lsuzu",@"Jaguar",@"Jeep",@"Kia",@"Lamborghini",@"Land Rover",@"Lexus",@"Lincoin",@"Lotus",@"Mazda",@"Mercedes-Benz",@"Mencury",@"Mitsubishi",@"Nissan",@"Oldsmobile",@"Peugeot",@"Pontiac",@"Porsche",@"Regal",@"Saab",@"Saturn",@"Subaru",@"Suzuki",@"Toyota",@"Volkswagen",@"Volvo", nil];
//    
////    self.search = [[UISearchBar alloc]initWithFrame:TLRect(0, 0, 1, 50/667)];
////    [self.view addSubview:self.search];
////    self.search.delegate = self;
////
//    self.searchResults = [NSMutableArray new];
//    
//    self.tableView = [[UITableView alloc]initWithFrame:TLRect(0, 0, 1, 603/667) style:UITableViewStylePlain];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    [self.view addSubview:self.tableView];
//    self.tableView.tableHeaderView = [self headView];
//    
////    [self.tableView setTableHeaderView:self.searchController.searchBar];
//}
//
////UISearchBar作为tableview的头部
//-(UIView *)headView{
//    
//    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 100, 44)];
//    searchBar.keyboardType = UIKeyboardAppearanceDefault;
//    searchBar.placeholder = @"请输入搜索关键字";
//    searchBar.delegate = self;
//    //底部的颜色
//    searchBar.barTintColor = [UIColor lightGrayColor];
//    searchBar.searchBarStyle = UISearchBarStyleDefault;
//    searchBar.barStyle = UIBarStyleDefault;
//    return searchBar;
//}
//
//#pragma mark -- UITableViewDateSource
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return _array.count;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    }
//    
//    for (UIView *view in cell.contentView.subviews) {
//        [view removeFromSuperview];
//    }
//    
//    TLCarModel *model = self.searchResults[indexPath.row];
//    cell.textLabel.text = model.content;
//    
//    return cell;
//}
//
//
////在搜索框中修改搜索内容时，自动触发下面的方法
//-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
//    return YES;
//}
//-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
//    
//    NSLog(@"开始输入搜索内容");
//    searchBar.showsCancelButton = YES;//取消的字体颜色，
//    [searchBar setShowsCancelButton:YES animated:YES];
//    
//    //改变取消的文本
//    for(UIView *view in [[[searchBar subviews] objectAtIndex:0] subviews]) {
//        if ([view isKindOfClass:[UIButton class]]) {
//            UIButton *cancel =(UIButton *)view;
//            [cancel setTitle:@"取消" forState:UIControlStateNormal];
//            [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        }
//    }
//}
//-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
//    NSLog(@"输入搜索内容完毕");
//}
//
////搜框中输入关键字的事件响应
//-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    
//    NSLog(@"输入的关键字是---%@---%lu",searchText,(unsigned long)searchText.length);
//    
//    //需要事先情况存放搜索结果的数组
//    [self.searchResults removeAllObjects];
//    
//    if (searchText!=nil && searchText.length>0) {
//        
//        //遍历需要搜索的所有内容，其中self.dataArray为存放总数据的数组
//        for (TLCarModel *model in self.array) {
//            NSString *tempStr = model.content;
//            
//            //----------->把所有的搜索结果转成成拼音
//            NSString *pinyin = [self transformToPinyin:tempStr];
//            NSLog(@"pinyin--%@",pinyin);
//            
//            if ([pinyin rangeOfString:searchText options:NSCaseInsensitiveSearch].length >0 ) {
//                //把搜索结果存放self.resultArray数组
//                [self.searchResults addObject:model];
//            }
//        }
//    }else{
//        self.searchResults = [NSMutableArray arrayWithArray:self.array];
//    }
//    [_tableView reloadData];
//    
//    
//    //加个多线程，否则数量量大的时候，有明显的卡顿现象
//    //这里最好放在数据库里面再进行搜索，效率会更快一些
////    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
////    dispatch_async(globalQueue, ^{
////        if (searchText!=nil && searchText.length>0) {
////            
////            //遍历需要搜索的所有内容，其中self.dataArray为存放总数据的数组
////            
////            for (int i = 0; i < self.array.count; i++)
////            {
////                NSString *s = self.array[i];
////                NSString *pinyin = [self transformToPinyin:s];
////                NSLog(@"pinyin--%@",pinyin);
////                if ([pinyin rangeOfString:searchText options:NSCaseInsensitiveSearch].length >0 ) {
////                    //把搜索结果存放self.resultArray数组
////                    [self.searchResults addObject:self.array[i]];
////                }
////            }
//////            for (DataModel *model in self.array) {
//////                
//////                NSString *tempStr = model.content;
//////                
//////                //----------->把所有的搜索结果转成成拼音
//////                NSString *pinyin = [self transformToPinyin:tempStr];
//////                NSLog(@"pinyin--%@",pinyin);
//////                
//////                if ([pinyin rangeOfString:searchText options:NSCaseInsensitiveSearch].length >0 ) {
//////                    //把搜索结果存放self.resultArray数组
//////                    [self.searchResults addObject:model];
//////                }
//////            }
////        }else{
////            self.searchResults = [NSMutableArray arrayWithArray:self.array];
////        }
////        //回到主线程
////        dispatch_async(dispatch_get_main_queue(), ^{
////            [_tableView reloadData];
////        });
////    });
//}
////取消的响应事件
//-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
//    
//    NSLog(@"取消搜索");
//    [searchBar setShowsCancelButton:NO animated:YES];
//    [searchBar resignFirstResponder];
//}
//
////键盘上搜索事件的响应
//-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    
//    NSLog(@"搜索");
//    [searchBar setShowsCancelButton:NO animated:YES];
//    [searchBar resignFirstResponder];
//}
//
//- (NSString *)transformToPinyin:(NSString *)aString
//{
//    //转成了可变字符串
//    NSMutableString *str = [NSMutableString stringWithString:aString];
//    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
//    //再转换为不带声调的拼音
//    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
//    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
//    NSMutableString *allString = [NSMutableString new];
//    
//    int count = 0;
//    
//    for (int  i = 0; i < pinyinArray.count; i++)
//    {
//        
//        for(int i = 0; i < pinyinArray.count;i++)
//        {
//            if (i == count) {
//                [allString appendString:@"#"];//区分第几个字母
//            }
//            [allString appendFormat:@"%@",pinyinArray[i]];
//            
//        }
//        [allString appendString:@","];
//        count ++;
//        
//    }
//    
//    NSMutableString *initialStr = [NSMutableString new];//拼音首字母
//    
//    for (NSString *s in pinyinArray)
//    {
//        if (s.length > 0)
//        {
//            
//            [initialStr appendString:  [s substringToIndex:1]];
//        }
//    }
//    
//    [allString appendFormat:@"#%@",initialStr];
//    [allString appendFormat:@",#%@",aString];
//    
//    return allString;
//}

@end
