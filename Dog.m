#import "Dog.h"

@implementation Dog
- (void)makeSound {
    NSLog(@"%@ barks! Woof!", self.name);
        LogWithLevel(@"INFO", @"%@ barks! Woof!", self.name);
}
- (void)fetch {
    NSLog(@"%@ is fetching the ball!", self.name);
    [self play];
        LogWithLevel(@"DEBUG", @"%@ is fetching the ball!", self.name);
}
@end
