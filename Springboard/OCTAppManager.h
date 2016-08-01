//
//  OCTAppManager.h
//  Springboard
//
//  Created by Octree on 2016/7/31.
//  Copyright © 2016年 Octree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCTApp.h"

@interface OCTAppManager : NSObject

@property (copy, nonatomic, readonly) NSArray *apps;

+ (instancetype)sharedManager;

/**
 *  扫描本地安装的 App
 */
- (void)scanApps;

/**
 *  打开 App
 *
 *  @param app OCTApp
 *
 *  @return success
 */
- (BOOL)openApp:(OCTApp *)app;

@end
