//
//  Channellnfo.h
//  DoubanPlayer
//
//  Created by lk on 16/5/7.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DFMChannelType) {
    DFMChannelTypeReccommend = 1,
    DFMChannelTypeUpTrending,
    DFMChannelTypeHot,
};

@interface ChannelInfo : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSMutableArray *)channels;

+ (instancetype)currentChannel;
+ (void)updateCurrentCannel:(ChannelInfo *)channel;

+ (NSArray *)channelsTitleArray;
+ (void)updateChannelsTitleArray:(NSArray *)array;
@end

