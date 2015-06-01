//
//  DownloadPictureViewController.m
//  Download
//
//  Created by Pavel on 31/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "PKDownloadPictureViewController.h"

@implementation PKDownloadPictureViewController

#pragma mark-  View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.hidden = YES;
    self.downloaderSimulator = [[PKDownloaderSimulator alloc] initWithProgressInterval:0.1];
    self.downloaderSimulator.delegate = self;
    self.pendingSimulator = [[PKDownloaderSimulator alloc] initWithProgressInterval:0.05];
    self.pendingSimulator.delegate = self;
}

#pragma mark - PKDownloadButtonDelegate

- (void)downloadButtonTapped:(PKDownloadButton *)downloadButton
                currentState:(PKDownloadButtonState)state {
    switch (state) {
        case kPKDownloadButtonState_StartDownload:
            self.downloadButton.state = kPKDownloadButtonState_Pending;
            [self.pendingSimulator startDownload];
            break;
        case kPKDownloadButtonState_Pending:
            [self.pendingSimulator cancelDownload];
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            break;
        case kPKDownloadButtonState_Downloading:
            [self.downloaderSimulator cancelDownload];
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            break;
        case kPKDownloadButtonState_Downloaded:
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            self.imageView.hidden = YES;
            break;
        default:
            NSAssert(NO, @"unsupported state");
            break;
    }
}

#pragma mark - DownloaderSimulatorDelegate

- (void)simulator:(PKDownloaderSimulator *)simulator didUpdateProgress:(double)progress {
    if (simulator == self.pendingSimulator) {
        if (progress == 1.) {
            self.downloadButton.state = kPKDownloadButtonState_Downloading;
            [self.downloaderSimulator startDownload];
        }
    }
    else if (simulator == self.downloaderSimulator) {
        self.downloadButton.stopDownloadButton.progress = progress;
        if (progress == 1) {
            self.downloadButton.state = kPKDownloadButtonState_Downloaded;
            self.imageView.hidden = NO;
        }
    }
}

@end
