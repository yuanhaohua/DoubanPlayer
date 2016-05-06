//
//  UserInfo.h
//  DoubanPlayer
//
//  Created by lk on 16/5/5.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>
@property(nonatomic,copy)NSString* isNotLogin;/**<不在线*/

@property(nonatomic,copy)NSString* cookies;/**<缓存纪录*/
@property(nonatomic,copy)NSString* userID;/**<用户ID*/
@property(nonatomic,copy)NSString* name;/**<用户名字*/
@property(nonatomic,copy)NSString* banned;
@property(nonatomic,copy)NSString* liked;
@property(nonatomic,copy)NSString* played;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;
//用户信息文档
-(void)archiverUserInfo;
@end
