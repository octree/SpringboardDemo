//
//  OCTApp.h
//  Springboard
//
//  Created by Octree on 2016/7/31.
//  Copyright © 2016年 Octree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCTApp : NSObject

@property (nonatomic, readonly) NSNumber *ODRDiskUsage;
@property (nonatomic, readonly) NSString *applicationIdentifier;
@property (nonatomic, readonly) NSString *applicationType;
@property (nonatomic, readonly) NSNumber *dynamicDiskUsage;
@property (nonatomic, readonly) BOOL isBetaApp;
@property (nonatomic, readonly) BOOL isInstalled;
@property (nonatomic, readonly) BOOL isNewsstandApp;
@property (nonatomic, readonly) BOOL isPlaceholder;
@property (nonatomic, readonly) BOOL isRestricted;
@property (nonatomic, readonly) BOOL isWatchKitApp;
@property (nonatomic, readonly) NSNumber *itemID;
@property (nonatomic, readonly) NSString *itemName;
@property (nonatomic, readonly) NSString *minimumSystemVersion;
@property (nonatomic, readonly) NSString *sdkVersion;
@property (nonatomic, readonly) NSString *shortVersionString;
@property (nonatomic, readonly) NSString *sourceAppIdentifier;
@property (nonatomic, readonly) NSNumber *staticDiskUsage;
@property (nonatomic, readonly) NSString *teamID;
@property (nonatomic, readonly) NSString *bundleIdentifier;


- (instancetype)initWithAppProxy:(id)app;

- (NSString *)localizedName;
- (UIImage *)iconImage;
- (NSString *)prettySizeString;
- (BOOL)isSystemOrInternalApp;

@end
