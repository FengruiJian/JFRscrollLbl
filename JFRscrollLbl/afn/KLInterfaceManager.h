//
//  KLInterfaceManager.h
//  KLShop
//
//  Created by liu on 16/2/1.
//  Copyright © 2016年 Harbin kelly network technology co., LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface KLInterfaceManager : NSObject
@property(nonatomic, strong) NSString *baseURLString;
+(instancetype)sharedKLInterface;
+(void)cancelNetWorkRequest;

@end
