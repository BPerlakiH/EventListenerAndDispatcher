//
//  EventBlockObject.h
//
//  Created by BPH on 10/04/2015.
//  Copyright (c) 2013 BPH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventDispatcher.h"

@interface EventBlockObject : NSObject

//@property NSString *eventName;
@property EventDispatcher *targetObject;
@property (copy) void (^callBack)(void);
@property (nonatomic, retain) NSString *eventName;

@end
