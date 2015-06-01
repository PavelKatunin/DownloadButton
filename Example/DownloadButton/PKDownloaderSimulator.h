//
//  DownloaderSimulator.h
//  Download
//
//  Created by Pavel on 01/06/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PKDownloaderSimulator;

@protocol PKDownloaderSimulatorDelegate <NSObject>

- (void)simulator:(PKDownloaderSimulator *)simulator didUpdateProgress:(double)progress;

@end

@interface PKDownloaderSimulator : NSObject

@property (nonatomic, weak) id <PKDownloaderSimulatorDelegate> delegate;

- (instancetype)initWithProgressInterval:(NSTimeInterval)progressInterval;

- (void)startDownload;
- (void)cancelDownload;

@end
