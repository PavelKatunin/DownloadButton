//
//  DownloadPictureViewController.h
//  Download
//
//  Created by Pavel on 31/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DownloadButton/PKDownloadButton.h>
#import "PKDownloaderSimulator.h"

@interface PKDownloadPictureViewController : UIViewController <PKDownloadButtonDelegate, PKDownloaderSimulatorDelegate>

@property (nonatomic, weak) IBOutlet PKDownloadButton *downloadButton;
@property (nonatomic, strong) PKDownloaderSimulator *downloaderSimulator;
@property (nonatomic, strong) PKDownloaderSimulator *pendingSimulator;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end
