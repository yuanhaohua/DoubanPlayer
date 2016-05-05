//
//  DFMHotChannelsEntity.m
//  DoubanPlayer
//
//  Created by lk on 16/5/5.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import "DFMHotChannelsEntity.h"

@implementation DFMHotChannelsEntity
+ (NSDictionary *)objectClassInArray
{
    return @{
             @"channels" : NSStringFromClass([ChannelInfo class]),
             };
}

@end
