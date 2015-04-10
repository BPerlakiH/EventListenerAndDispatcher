# EventListenerAndDispatcher
Event listener and dispatcher solution in Objective-C similar to the one used in ActionScript 3.

#Example usage:

    //set up the dispatcher in your model, or other class:
    model.dispatcher = [[EventDispatcher alloc] init];
    self.listener = [[EventListener alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [self.listener addEventListener:model.dispatcher forEvent:@"customEvent" functionBlock:^{[weakSelf _onCustomEvent];}];
    [self.listener addEventListener:model.dispatcher forEvent:@"myEventComplete" functionBlock:^{[weakSelf _onMyComplete];}]
    
    //Your model will dispatch some events:
    [model.dispatcher dispatchEvent:@"customEvent"];
    [model.dispatcher dispatchEvent:@"myEventComplete"];

    
    - (void) _onCustomEvent {
      NSLog(@"_onCustomEvent");
      [self.listener removeEventListener:model.dispatcher forEvent:@"customEvent"];
    }
    
    - (void) _onMyComplete {
      NSLog(@"_onMyComplete");
      [self.listener removeEventListener:model.dispatcher forEvent:@"myEventComplete"];
    }
    
#Note:  
Removing the event listeners is optional, as when the listener object is deallocated, it will clear up the references.
    
#Common Pitfalls:
If the listener or the dispatcher is not allocated + initialised, events won't fire properly, and nothing will be called.
  
