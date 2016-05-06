//
//  DFMPlaylist.m
//  DoubanPlayer
//
//  Created by lk on 16/5/6.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import "DFMPlaylist.h"
#import "SongInfo.h"
@implementation DFMPlaylist

+(NSDictionary*)objectClassInArray
{
    return @{@"song":NSStringFromClass([SongInfo class])};
}

@end
