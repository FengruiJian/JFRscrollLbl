//
//  KLInterfaceManager.m
//  KLShop
//
//  Created by liu on 16/2/1.
//  Copyright © 2016年 Harbin kelly network technology co., LTD. All rights reserved.
//

#import "KLInterfaceManager.h"
@interface KLInterfaceManager ()
/**
 *  @brief  HTTP请求管理者便利化配置
 *
 *  @return HTTP网络请求管理者
 */
+ (AFHTTPRequestOperationManager *)sharedHTTPOperationManager;
/**
 *  专门获取图片的manager
 *
 *  @return 获取图片的请求对象
 */
+ (AFHTTPRequestOperationManager *)sharedImageHTTPOperationManager;
@end

@implementation KLInterfaceManager
#pragma mark - Base
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.baseURLString = KAPI_BASEURL;
    }
    return self;
}

+ (instancetype)sharedKLInterface
{
    static KLInterfaceManager *interface;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        interface = [[KLInterfaceManager alloc]init];
    });
    return interface;
}

#pragma mark -- HTTP请求管理者便利化配置
+ (void)logCurrentCookie
{
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSLog(@"\n@@@@@@@@@\n\n%@\n\n@@@@@@@@@", cookieStorage.cookies);
}

+ (AFHTTPRequestOperationManager *)sharedHTTPOperationManager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",  @"text/json", @"image/jpg", nil];
    //    [manager.requestSerializer setValue:[RHCTGlobal getGlobalUserAgent] forHTTPHeaderField:@"User-Agent"];
#ifdef K_InterfaceRequest_CookieInfoDebug
    [self logCurrentCookie];
#endif
    return manager;
}


+ (AFHTTPRequestOperationManager *)sharedImageHTTPOperationManager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFImageResponseSerializer serializer];
    [manager.requestSerializer setValue:@"dasd" forHTTPHeaderField:@"User-Agent"];
#ifdef K_InterfaceRequest_CookieInfoDebug
    [self logCurrentCookie];
#endif
    return manager;
}

+ (void)cancelNetWorkRequest
{
    [[[KLInterfaceManager sharedHTTPOperationManager] operationQueue] cancelAllOperations];
}

@end
