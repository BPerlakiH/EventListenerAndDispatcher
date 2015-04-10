//
//  EventBlockObject.m
//
//  Created by BPH on 10/04/2015.
//  Copyright (c) 2013 BPH. All rights reserved.
//

#import "EventBlockObject.h"

@implementation EventBlockObject

@synthesize eventName, targetObject, callBack;

- (void)dealloc {
    self.targetObject = nil;
    self.callBack = nil;
}

@end
