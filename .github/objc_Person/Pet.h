#import <Foundation/Foundation.h>

extern int gErrorCount;
void LogWithLevel(NSString *level, NSString *format, ...);

@interface Pet : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *species;
@property (nonatomic) NSInteger hungerLevel; // 0 = full, higher = hungrier
@property (nonatomic) NSInteger cleanliness; // 0 = clean, higher = dirtier

- (instancetype)initWithName:(NSString *)name species:(NSString *)species;
- (void)feed;
- (void)clean;
- (void)play;
- (void)makeSound; // Common method to be overridden
- (BOOL)isHungry;
- (BOOL)isDirty;
@end
