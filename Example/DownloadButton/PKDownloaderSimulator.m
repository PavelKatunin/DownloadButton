//
//  DownloaderSimulator.m
//  Download
//
//  Created by Pavel on 01/06/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "PKDownloaderSimulator.h"

static double progressStep = 0.01;

@interface PKDownloaderSimulator ()

@property (strong) NSTimer *timer;
@property (assign) volatile double progress;
@property (assign) NSTimeInterval progressInterval;

@end

@implementation PKDownloaderSimulator

#pragma mark - initialization

- (instancetype)initWithProgressInterval:(NSTimeInterval)progressInterval {
    self = [super init];
    if (self != nil) {
        self.progressInterval = progressInterval;
    }
    return self;
}

#pragma mark - methods

- (void)startDownload {
    self.progress = 0.;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.progressInterval
                                                  target:self
                                                selector:@selector(increaseProgress)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)cancelDownload {
    self.progress = 0.;
    [self.timer invalidate];
}

- (void)increaseProgress {
    if (1. - self.progress > progressStep) {
        self.progress += progressStep;
    }
    else {
        self.progress = 1.;
        [self.timer performSelector:@selector(invalidate) withObject:nil afterDelay:0];
    }
    [self.delegate simulator:self didUpdateProgress:self.progress];
}

@end
