//
//  EventListener.m
//
//  Created by BPH on 10/04/2015.
//  Copyright (c) 2013 BPH. All rights reserved.
//

#import "EventListener.h"
#import "EventBlockObject.h"
#import "EventDispatcher.h"

@implementation EventListener

- (id) init {
    if(self = [super init]) {
        _eventBlocks = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addEventListener:(EventDispatcher *)object forEvent:(NSString *)eventName functionBlock:(void (^)(void))callBack {
    if(!object) {
        DLog(@"nil object passed");
        return;
    }
    
    NSString *key = [self _getKeyForObject:object andEvent:eventName];
    EventBlockObject *block = [_eventBlocks valueForKey:key];
    if(block) {
//        DLog(@"WARNING! overwriting event listener previously added for key: %@", key);
        [self removeEventListener:block.targetObject forEvent:eventName];
        [_eventBlocks removeObjectForKey:key];
        block = nil;
    }
    block = [[EventBlockObject alloc] init];
    block.targetObject = object;
    block.callBack = callBack;
    block.eventName = eventName;
    
    [_eventBlocks setValue:block forKey:key];
    
    [object addObserver:self forKeyPath:eventName options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeEventListener:(EventDispatcher *)object forEvent:(NSString *)eventName {
    @try {
        [object removeObserver:self forKeyPath:eventName];
    }
    @catch (NSException *exception) {
        //
    }
}

- (void) dealloc {
    if(_eventBlocks) {
        for (NSString *key in _eventBlocks) {
            EventBlockObject *block = _eventBlocks[key];
            [self removeEventListener:block.targetObject forEvent:block.eventName];
        }
        [_eventBlocks removeAllObjects];
        _eventBlocks = nil;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    EventDispatcher *dispatcher = (EventDispatcher*) object;
    if(!dispatcher) {
        //it is not an EventDispatcher
        return;
    }
    NSString *key = [self _getKeyForObject:object andEvent:keyPath];
    EventBlockObject *block = [_eventBlocks valueForKey:key];
    if(!block) {
        //we are not listening to it
        return;
    }
    //double check if it's the same object for sure:
    if(block.targetObject == object) {
        block.callBack();
    }
}

- (NSString*) _getKeyForObject: (EventDispatcher*) obj andEvent: (NSString*) eventName {
    NSString *key = [NSString stringWithFormat:@"%@_%@", eventName, obj.description];
    return key;
}

@end
