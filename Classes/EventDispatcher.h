//
//  EventDispather.h
//
//  Created by BPH on 10/04/2015.
//  Copyright (c) 2013 BPH. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COMPLETED @"completed"

@interface EventDispatcher : NSObject {
    NSMutableDictionary *_events;
}

//@property (nonatomic) double completed;

//- (void) dispatchCompleted;
- (void) dispatchEvent: (NSString *) eventName;

@end
