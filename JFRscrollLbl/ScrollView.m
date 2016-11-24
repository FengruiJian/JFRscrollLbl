//
//  ScrollView.m
//  
//
//  Created by iOS Dev on 15/12/16.
//  Copyright © 2015年 iOS Dev. All rights reserved.
//



  // 大致思路和图片无限滚动轮播差不多，还要多多改善哈
#import "ScrollView.h"
#import "Masonry.h"

@interface ScrollView()<UIScrollViewDelegate>{
    NSArray *arr;
}

@property (nonatomic,strong)UIScrollView *mainScrollView;
@property (nonatomic,strong)UIPageControl*mainPageControl;

@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic, assign) CGFloat widthOfView;

@property (nonatomic, assign) CGFloat heightView;
@end
@implementation ScrollView
 //构造遍历器
+(instancetype) ScrollViewWithFrame:(CGRect)frame :(NSArray *)arr{

    ScrollView *instance=[[ScrollView alloc]initWithFrame:frame WithImages:arr];
    return instance;
}
  //初始化遍历器
-(instancetype) initWithFrame:(CGRect)frame WithImages:(NSArray *)arrr{
    self = [super initWithFrame:frame];
    if (self) {
        _widthOfView = frame.size.width;
        _heightView = frame.size.height;
        arr=arrr;
        
        [self myscroll];
    }
    return self;
}

-(void)myscroll{
    
  //在这里可以自定义你的view 并赋值
    
    //初始化scrollview和pagecontrol
    _mainScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _widthOfView, _heightView)];
    [self addSubview:_mainScrollView];

    _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, _mainScrollView.frame.size.width, _mainScrollView.frame.size.height)];
        [self addSubview:_btn];

    NSLog(@"%f",_mainPageControl.frame.size.height);
    _mainScrollView.contentSize=CGSizeMake(0, _heightView);//高度设为0，禁止滚动
    _mainScrollView.pagingEnabled=YES;//设置图片翻页
    _mainScrollView.delegate=self;//设置代理
    
    for (int i=0; i<[arr count]; i++) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,  _mainScrollView.frame.size.width,  _mainScrollView.frame.size.height)];
        
        [_mainScrollView addSubview:backView];

        _iconLbl = [[UIImageView alloc]initWithFrame:CGRectMake(0, _mainScrollView.frame.size.height*i, 20, 20)];
        _iconLbl.image = [UIImage imageNamed:@"VIP.png"];
        [backView addSubview:_iconLbl];
        _l1 = [[UILabel alloc]initWithFrame:CGRectMake(65, _mainScrollView.frame.size.height*i, _mainScrollView.frame.size.width-20, 20)];
        
        _l1.font = [UIFont systemFontOfSize:15];


            NSString *name = [NSString stringWithFormat:@"%@",[arr[i] objectForKey:@"name"]];

        if (![name isEqualToString:@""]) {
            NSString *na = [name substringToIndex:1];
            _l1.text = [NSString stringWithFormat:@"%@** %@%@ %@",na,[arr[i]objectForKey:@"brand"],[arr[i] objectForKey:@"modle"],[arr[i] objectForKey:@"cost"]];
        }

        [backView addSubview:_l1];
        
    }
    
    _timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerlel:) userInfo:nil repeats:YES];//开启定时器
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    _mainScrollView.contentOffset=CGPointMake(0, _heightView);//设置scrollview的开始便宜量为第一张图片
    
    _mainScrollView.showsVerticalScrollIndicator = FALSE;
    _mainScrollView.showsHorizontalScrollIndicator = FALSE;
    
    
}
#pragma mark 实现滚动具体逻辑方法
-(void)tiao1:(UITapGestureRecognizer *)pp{
    
    UIImageView *img=(UIImageView*)pp.view;//找到手势所在的imageview
    
    int mm=(int)img.tag;//取出tag值
    
    if(mm==1){//通过tag值判断是对那个uiimageview进行操作
        
        NSLog(@"0");
        
    }
    if(mm==2){//通过tag值判断是对那个uiimageview进行操作
        
        NSLog(@"1");
        
    }
    if(mm==3){//通过tag值判断是对那个uiimageview进行操作
        
        NSLog(@"2");
        
    }
    if(mm==4){//通过tag值判断是对那个uiimageview进行操作
        
        NSLog(@"3");
        
    }
    if(mm==5){//通过tag值判断是对那个uiimageview进行操作
        
        NSLog(@"4");
        
    }
    
}

-(void)timerlel:(NSTimer *)timer{
    
    int aa=(int)_mainScrollView.contentOffset.y/_heightView;//获取当前的页数
    
    aa++;//页数每次都加一
    
    [self changepage:aa];
}



-(void)changepage:(int)ppage{
    
    
    if(ppage==[arr count]-1){//如果页数为6时
        
        [_mainScrollView setContentOffset:CGPointMake(0, 0) animated:NO];//设置偏移量为第0张图片
        [_mainScrollView setContentOffset:CGPointMake(0, _heightView) animated:YES];//设置从第一张相后滚动
        _mainPageControl.currentPage=0;//设置page的显示为第0页
        
    }
    else if(ppage==0){//如果页数为0时
        
        [_mainScrollView setContentOffset:CGPointMake(0, [arr count]*_heightView) animated:NO];//设置偏移量为第6张图片
        [_mainScrollView setContentOffset:CGPointMake(0, [arr count]*_heightView) animated:YES];//设置从第五张开始向后滚动
        _mainPageControl.currentPage=5;
        
        
    }
    else {//其他页数时
        
        
        [_mainScrollView setContentOffset:CGPointMake(0, ppage*_heightView) animated:YES];//正常向后滚动
        _mainPageControl.currentPage=ppage-1;//设置当前page为pagge－1
    }
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    int hh=(int)_mainScrollView.contentOffset.y/_heightView;
    
    [_timer invalidate];//计时器停止
    
    _timer=nil;//计时器为空
    
    
    if(hh==[arr count]-1){
        
        
        [_mainScrollView setContentOffset:CGPointMake(0, _heightView) animated:NO];
        _mainPageControl.currentPage=0;
        
    }
    
    else if(hh==0){
        
        [_mainScrollView setContentOffset:CGPointMake(0, [arr count]*_heightView) animated:NO];
        [_mainScrollView setContentOffset:CGPointMake(0, [arr count]*_heightView) animated:YES];
        _mainPageControl.currentPage=5;
        
    }
    else  _mainPageControl.currentPage=hh-1;
    
    _timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(tiaoo) userInfo:nil repeats:YES];
    
}

@end
