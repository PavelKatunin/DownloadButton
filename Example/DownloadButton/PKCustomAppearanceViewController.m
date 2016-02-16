//
//  CustomAppearanceViewController.m
//  Download
//
//  Created by Pavel on 31/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "PKCustomAppearanceViewController.h"
#import "UIImage+PKDownloadButton.h"

@implementation PKCustomAppearanceViewController

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.downloadButton.downloadedButton cleanDefaultAppearance];
    [self.downloadButton.downloadedButton setBackgroundImage:[UIImage buttonBackgroundWithColor:[UIColor redColor]]
                                                    forState:UIControlStateNormal];
    [self.downloadButton.downloadedButton setBackgroundImage:[UIImage highlitedButtonBackgroundWithColor:[UIColor redColor]]
                                                    forState:UIControlStateHighlighted];
    [self.downloadButton.downloadedButton setTitle:@"delete" forState:UIControlStateNormal];
    [self.downloadButton.downloadedButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.downloadButton.downloadedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    self.downloadButton.stopDownloadButton.tintColor = [UIColor blackColor];
    self.downloadButton.stopDownloadButton.filledLineStyleOuter = YES;
    
    self.downloadButton.pendingView.tintColor = [UIColor orangeColor];
    self.downloadButton.pendingView.radius = 24.f;
    self.downloadButton.pendingView.emptyLineRadians = 2.f;
    self.downloadButton.pendingView.spinTime = 3.f;
    
    [self.downloadButton.startDownloadButton cleanDefaultAppearance];
    [self.downloadButton.startDownloadButton setImage:[UIImage imageNamed:@"download_default"] forState:UIControlStateNormal];
}

@end
