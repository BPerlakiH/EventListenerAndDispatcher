//
//  EventDispather.m
//
//  Created by BPH on 10/04/2015.
//  Copyright (c) 2013 BPH. All rights reserved.
//

#import "EventDispatcher.h"

@implementation EventDispatcher

- (id) init {
    if(self = [super init]) {
        _events = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)dispatchEvent:(NSString *)eventName {
    [self setValue:[self _getTimeStamp] forKey:eventName];
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSNumber *value = [_events valueForKey:key];
    if(!value) {
        return [super valueForUndefinedKey:key];
    }
    return value;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [_events setValue:value forKey:key];
}

- (NSNumber *) _getTimeStamp {
    double num =  [[NSDate date] timeIntervalSince1970];
    NSNumber *nsNumber = @(num);
    return nsNumber;
}

@end
