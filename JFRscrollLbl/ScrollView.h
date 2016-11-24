//
//  ScrollView.h
//
//
//  Created by iOS Dev on 15/12/16.
//  Copyright © 2015年 iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollView : UIView
@property (nonatomic ,strong) UIImageView *iconLbl;
@property (nonatomic ,strong) UILabel *l1;

@property (nonatomic ,strong) UIButton *btn;

+(instancetype) ScrollViewWithFrame:(CGRect)frame :(NSArray *)arr;
-(instancetype) initWithFrame:(CGRect)frame WithImages:(NSArray *)arr;
@end
