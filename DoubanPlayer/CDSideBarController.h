//
//  CDSideBarController.h
//  DoubanPlayer
//
//  Created by yuan on 16/5/5.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@protocol CDSideBarControllerDelegate <NSObject>
- (void)menuButtonClicked:(int)index;

@end

@interface CDSideBarController : NSObject
{
    UIView              *_backgroundMenuView;
    UIButton            *_menuButton;
    NSMutableArray      *_buttonList;
}


@property (nonatomic, retain) UIColor *menuColor;
@property (nonatomic) BOOL isOpen;

@property (nonatomic, weak) id<CDSideBarControllerDelegate> delegate;
+(CDSideBarController *)sharedInstanceWithImages:(NSArray*)images;
+(CDSideBarController *)sharedInstance;
- (CDSideBarController*)initWithImages:(NSArray*)buttonList;
- (void)insertMenuButtonOnView:(UIView*)view atPosition:(CGPoint)position;
- (void)dismissMenu;


@end

