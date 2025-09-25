#import "Bird.h"

@implementation Bird
- (void)makeSound {
    NSLog(@"%@ chirps! Tweet!", self.name);
        LogWithLevel(@"INFO", @"%@ chirps! Tweet!", self.name);
}
- (void)fly {
    NSLog(@"%@ is flying around!", self.name);
    [self play];
        LogWithLevel(@"DEBUG", @"%@ is flying around!", self.name);
}
@end
