#import <Foundation/Foundation.h>
#import <stdarg.h>
#import "Pet.h"

int gErrorCount = 0;
void LogWithLevel(NSString *level, NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *msg = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    NSLog(@"[%@] %@", level, msg);
    if ([level isEqualToString:@"ERROR"]) {
        gErrorCount++;
    }
}


@implementation Pet

- (instancetype)initWithName:(NSString *)name species:(NSString *)species {
    self = [super init];
    if (self) {
        _name = name;
        _species = species;
        _hungerLevel = 0;
        _cleanliness = 0;
    }
    return self;
}


- (void)feed {
    if (_hungerLevel == 0) {
        LogWithLevel(@"ERROR", @"%@ is already full and cannot be fed!", self.name);
        return;
    }
    LogWithLevel(@"DEBUG", @"Feeding %@... (simulating time-consuming operation)", self.name);
    [NSThread sleepForTimeInterval:1.0];
    _hungerLevel--;
    LogWithLevel(@"INFO", @"%@ has been fed. Hunger level is now %ld.", self.name, (long)_hungerLevel);
}


- (void)clean {
    if (_cleanliness == 0) {
        LogWithLevel(@"ERROR", @"%@ is already clean and cannot be cleaned again!", self.name);
        return;
    }
    LogWithLevel(@"DEBUG", @"Cleaning %@... (simulating time-consuming operation)", self.name);
    [NSThread sleepForTimeInterval:1.0];
    _cleanliness = 0;
    LogWithLevel(@"INFO", @"%@ has been cleaned.", self.name);
}

- (void)play {
    LogWithLevel(@"DEBUG", @"%@ is playing... (simulating time-consuming operation)", self.name);
    [NSThread sleepForTimeInterval:1.0];
    _hungerLevel++;
    _cleanliness++;
    LogWithLevel(@"DEBUG", @"%@ played. Hunger: %ld, Cleanliness: %ld", self.name, (long)_hungerLevel, (long)_cleanliness);
}

- (void)makeSound {
    LogWithLevel(@"INFO", @"%@ makes a generic pet sound.", self.name);
}

- (BOOL)isHungry {
    return _hungerLevel > 2;
}

- (BOOL)isDirty {
    return _cleanliness > 2;
}

@end
