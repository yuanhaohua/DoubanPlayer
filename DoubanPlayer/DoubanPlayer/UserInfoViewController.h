//
//  UserInfoViewController.h
//  DoubanPlayer
//
//  Created by lk on 16/5/7.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import "LoginViewController.h"
#import "NetworkManager.h
#import "AppDelegate.h"
#import "ProtocolClass.h"
@interface UserInfoViewController : UIViewController <DoubanDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *loginImage;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *playedLabel;
@property (strong, nonatomic) IBOutlet UILabel *likedLabel;
@property (strong, nonatomic) IBOutlet UILabel *bannedLabel;
@property (strong, nonatomic) IBOutlet UIButton *logoutButton;
- (IBAction)logoutButtontapped:(UIButton *)sender;
-(void)setUserInfo;
-(void)logoutSuccess;

@end
