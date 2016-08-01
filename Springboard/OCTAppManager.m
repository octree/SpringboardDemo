
//
//  OCTAppManager.m
//  Springboard
//
//  Created by Octree on 2016/7/31.
//  Copyright © 2016年 Octree. All rights reserved.
//

#import "OCTAppManager.h"


@implementation OCTAppManager

#pragma mark - Life Cycle

+ (instancetype)sharedManager {

    static OCTAppManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[OCTAppManager alloc] init];
    });
    
    return manager;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#pragma mark - Public Methods
- (void)scanApps {
    
    Class cls = NSClassFromString(@"LSApplicationWorkspace");
    id s = [(id)cls performSelector:NSSelectorFromString(@"defaultWorkspace")];
//    allApplications
    NSArray *arr = [s performSelector:NSSelectorFromString(@"allInstalledApplications")];
    NSMutableArray *apps = [NSMutableArray arrayWithCapacity:arr.count];
    for (id item in arr) {
        
        [apps addObject: [[OCTApp alloc] initWithAppProxy: item]];
    }
    
    _apps = [apps copy];
}

- (BOOL)openApp:(OCTApp *)app {

    Class cls = NSClassFromString(@"LSApplicationWorkspace");
    id s = [(id)cls performSelector:NSSelectorFromString(@"defaultWorkspace")];
//
    BOOL success = [s performSelector:NSSelectorFromString(@"openApplicationWithBundleID:") withObject:app.bundleIdentifier];
    NSLog(@"open: %zd", success);
    
    return success;
}

#pragma clang diagnostic pop

@end
