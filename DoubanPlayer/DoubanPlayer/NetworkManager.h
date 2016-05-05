//
//  NetworkManager.h
//  DoubanPlayer
//
//  Created by lkjy on 16/5/5.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtocolClass.h"
@interface NetworkManager : NSObject

@property (weak, nonatomic)id<DoubanDelegate>delegate;//引进协议

@property (nonatomic) NSMutableString *captchaID;//验证码ID

+ (instancetype)sharedInstancd; //实例

-(instancetype)init;//初始化

-(void)setChannel:(NSUInteger)channelIndex withURLWithString:(NSString *)urlWithString;//设置频道与它的资源占位符

-(void)LoginwithUsername:(NSString *)username Password:(NSString *)password
Captcha:(NSString *)captc RememberOnorOff:(NSString *)rememberOnorOff;//用户名注册及密码设置，验证码


-(void)logout;//注销

-(void)loadCaptchaImage;//加载验证码

-(void)loadPlaylistwithType:(NSString *)type;//


@end
