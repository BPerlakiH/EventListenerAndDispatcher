//
//  EventListener.h
//
//  Created by BPH on 10/04/2015.
//  Copyright (c) 2013 BPH. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EventDispatcher;

@interface EventListener : NSObject {
    NSMutableDictionary *_eventBlocks;
}

- (void) addEventListener:(EventDispatcher *)object forEvent: (NSString*) eventName functionBlock:(void (^)(void))callBack;
- (void) removeEventListener:(EventDispatcher *)object forEvent: (NSString*) eventName;

@end
