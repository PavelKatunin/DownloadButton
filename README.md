# DownloadButton

[![CI Status](http://img.shields.io/travis/Pavel Katunin/DownloadButton.svg?style=flat)](https://travis-ci.org/Pavel Katunin/DownloadButton)
[![Version](https://img.shields.io/cocoapods/v/DownloadButton.svg?style=flat)](http://cocoapods.org/pods/DownloadButton)
[![License](https://img.shields.io/cocoapods/l/DownloadButton.svg?style=flat)](http://cocoapods.org/pods/DownloadButton)
[![Platform](https://img.shields.io/cocoapods/p/DownloadButton.svg?style=flat)](http://cocoapods.org/pods/DownloadButton)

Customizable appstore style download button.

![Default button animation](https://cloud.githubusercontent.com/assets/1636737/7921348/7fadc250-08ad-11e5-9f01-9f7e1f173a97.gif)

![Default button](https://cloud.githubusercontent.com/assets/1636737/7920830/2c4470da-08aa-11e5-99be-e7e9a04479f8.png)

Customizable designable components. Editing with IB.

![Custom button animation](https://cloud.githubusercontent.com/assets/1636737/7921396/ec8b21c4-08ad-11e5-99a4-c73c971c0d42.gif)

![Custom button](https://cloud.githubusercontent.com/assets/1636737/7920909/7403d906-08aa-11e5-92d5-f92a09bc2bdc.png)

![Designable button](https://cloud.githubusercontent.com/assets/1636737/7921499/92a772ba-08ae-11e5-9222-e5bd229de6b2.gif)


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.
Check example project to see usage.

```objective-c
#import <DownloadButton/PKDownloadButton.h>
```

Usage for representing network operations:

```objective-c
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
```

Appearance customization:

```objective-c

#import "UIImage+PKDownloadButton.h"
#import "UIButton+PKDownloadButton.h"

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

```

## Requirements

Requires iOS SDK version > 8.0

## Installation

DownloadButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DownloadButton"
```

## Author

Pavel Katunin, wk.katunin@gmail.com

## License

DownloadButton is available under the Apache License, Version 2.0. See the LICENSE file for more info.
