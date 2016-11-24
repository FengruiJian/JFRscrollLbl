//
//  ViewController.m
//  JFRscrollLbl
//
//  Created by mac on 16/11/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"
#import "NetworkSingleton.h"
@interface ViewController ()
@property (nonatomic,strong)ScrollView *scroll;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}
-(void)initData{
    _dataArr = [NSMutableArray array];
    
    NSString *url = @"http://fengyue58.com/index.php/Home/Index/APP_indexTurnsOrder";
   
    [[NetworkSingleton sharedManager]getDataResult:nil url:url successBlock:^(id responseBody) {
        NSMutableArray *data = responseBody ;
        _dataArr = data;
        NSLog(@"%@",_dataArr);
        CGRect frame = CGRectMake(0, 100, self.view.frame.size.width, 40);
        _scroll = [ScrollView ScrollViewWithFrame:frame :_dataArr];
        //    _scrollview.left = zxBtn.right+20;
        [_scroll.btn addTarget:self action:@selector(zxAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_scroll];
        
    } failureBlock:^(NSString *error) {
        NSLog(@"%@",error);
    }];

    
}
-(void)zxAction{
    NSLog(@"gogo");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
