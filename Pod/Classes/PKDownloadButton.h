//
//  PKDownloadButton.h
//  PKDownloadButton
//
//  Created by Pavel on 28/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PKStopDownloadButton.h"
#import "PKCircleProgressView.h"
#import "PKPendingView.h"

typedef NS_ENUM(NSUInteger, PKDownloadButtonState) {
    kPKDownloadButtonState_StartDownload,
    kPKDownloadButtonState_Pending,
    kPKDownloadButtonState_Downloading,
    kPKDownloadButtonState_Downloaded
};

@class PKDownloadButton;

typedef void(^DownloadButtonTappedCallback)(PKDownloadButton *downloadButton, PKDownloadButtonState state);

@protocol PKDownloadButtonDelegate <NSObject>

- (void)downloadButtonTapped:(PKDownloadButton *)downloadButton
                currentState:(PKDownloadButtonState)state;

@end

IB_DESIGNABLE
@interface PKDownloadButton : UIView

@property (nonatomic, weak) IBOutlet id <PKDownloadButtonDelegate> delegate;
@property (nonatomic, copy) DownloadButtonTappedCallback callback;

@property (nonatomic, weak, readonly) UIButton *startDownloadButton;
@property (nonatomic, weak, readonly) PKStopDownloadButton *stopDownloadButton;
@property (nonatomic, weak, readonly) UIButton *downloadedButton;
@property (nonatomic, weak, readonly) PKPendingView *pendingView;

@property (nonatomic, assign) PKDownloadButtonState state;

@end