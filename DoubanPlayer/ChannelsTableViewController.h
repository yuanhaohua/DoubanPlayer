//
//  ChannelsTableViewController.h
//  DoubanPlayer
//
//  Created by lk on 16/5/7.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "ChannelsTableViewCell.h"
#import "Channellnfo.h"
#import "AppDelegate.h"
#import "NetworkManager.h"
#import "PlayerController.h"
#import "ProtocolClass.h"

@interface ChannelsTableViewController : UITableViewController <DoubanDelegate>

@property (nonatomic, weak) id<DoubanDelegate> delegate;

@property (nonatomic) NSMutableArray *channels;
@property (nonatomic) NSArray *channelsTitle;
@property (nonatomic) NSArray *myChannels;
@property (nonatomic) NSMutableArray *recommendChannels;
@property (nonatomic) NSMutableArray *upTrendingChannels;
@property (nonatomic) NSMutableArray *hotChannels;

@end

