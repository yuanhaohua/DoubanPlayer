//
//  Channellnfo.m
//  DoubanPlayer
//
//  Created by lk on 16/5/5.
//  Copyright © 2016年 yuan. All rights reserved.
//
#import "ChannelInfo.h"
static ChannelInfo *currentChannel;
static NSArray *channelsTitleArray;

@implementation ChannelInfo
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if (self = [super init]) {
        self.ID = [dictionary objectForKey:@"id"];
        self.name = [dictionary objectForKey:@"name"];
    }
    return self;
}

+ (NSMutableArray *)channels{
    static NSMutableArray *channels;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        channels = [NSMutableArray array];
    });
    return channels;
}

+ (instancetype)currentChannel
{
    if (!currentChannel)
    {
        currentChannel = [[self alloc] init];
    }
    return currentChannel;
}

+ (void)updateCurrentCannel:(ChannelInfo *)channel
{
    currentChannel = channel;
}

+ (NSArray *)channelsTitleArray
{
    if (!channelsTitleArray) {
        channelsTitleArray = [NSArray array];
    }
    return channelsTitleArray;
}

+ (void)updateChannelsTitleArray:(NSArray *)array{
    channelsTitleArray = array;
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID" : @"id",
             };
}

@end

