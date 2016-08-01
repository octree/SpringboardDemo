//
//  OCTAppViewController.m
//  Springboard
//
//  Created by Octree on 2016/8/1.
//  Copyright © 2016年 Octree. All rights reserved.
//

#import "OCTHomeViewController.h"
#import "OCTAppManager.h"
#import "OCTAppCell.h"

@interface OCTHomeViewController ()

@property (strong, nonatomic) OCTAppManager *appManager;

@end

@implementation OCTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.appManager.apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OCTAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OCTAppCell"
                                                       forIndexPath:indexPath];
    
    OCTApp *app = self.appManager.apps[ indexPath.row ];
    cell.nameLabel.text = [app localizedName];
    cell.sizeLabel.text = [app prettySizeString];
    cell.iconImageView.image = [app iconImage];
    cell.iconImageView.layer.masksToBounds = YES;
    cell.iconImageView.layer.cornerRadius = 6;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    OCTApp *app = self.appManager.apps[ indexPath.row ];
    [self.appManager openApp: app];
}

- (OCTAppManager *)appManager {

    if (!_appManager) {
    
        _appManager = [OCTAppManager sharedManager];
        [_appManager scanApps];
    }
    
    return _appManager;
}

@end
