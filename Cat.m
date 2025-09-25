#import "Cat.h"

@implementation Cat
- (void)makeSound {
    NSLog(@"%@ meows! Meow!", self.name);
        LogWithLevel(@"INFO", @"%@ meows! Meow!", self.name);
}
- (void)scratch {
    NSLog(@"%@ is scratching the furniture!", self.name);
    [self play];
        LogWithLevel(@"DEBUG", @"%@ is scratching the furniture!", self.name);
}
@end
