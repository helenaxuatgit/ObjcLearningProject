#import "Person.h"
#import <dispatch/dispatch.h>
#import "Pet.h"

@implementation Person 

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age occupation:(NSString *)occupation {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _occupation = occupation;
        _pets = [NSMutableArray array];
    }
    return self;
}

 -(void)greet {
    LogWithLevel(@"INFO", @"Hello, my name is %@. I am %ld years old and I work as a %@.", self.name, (long)self.age, self.occupation);
}

 -(void)haveBirthday {
    self.age += 1;
    LogWithLevel(@"INFO", @"Happy birthday, %@! You are now %ld years old.", self.name, (long)self.age);
}

 -(void)changeOccupation:(NSString *)newOccupation {
    self.occupation = newOccupation;
    LogWithLevel(@"INFO", @"%@ has changed occupation to %@.", self.name, self.occupation);
}


#pragma mark - Pet Methods

 -(void)addPet:(id)pet {
    [self.pets addObject:pet];
    LogWithLevel(@"INFO", @"%@ now has a new pet: %@!", self.name, [pet name]);
}

- (void)feedAllPetsConcurrently {
    LogWithLevel(@"INFO", @"%@ is feeding all pets concurrently...", self.name);
    for (id pet in self.pets) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            [pet feed];
            LogWithLevel(@"INFO", @"%@ fed %@.", self.name, [pet name]);
        });
    }
}

- (void)feedPet:(id)pet {
    if ([self.pets containsObject:pet]) {
        [pet feed];
        LogWithLevel(@"INFO", @"%@ fed %@.", self.name, [pet name]);
    }
}

- (void)cleanAllPetsSequentially {
    LogWithLevel(@"INFO", @"%@ is cleaning all pets one by one...", self.name);
    dispatch_queue_t serialQueue = dispatch_queue_create("com.objclearning.cleanpets", DISPATCH_QUEUE_SERIAL);
    for (id pet in self.pets) {
        dispatch_sync(serialQueue, ^{
            [pet clean];
            LogWithLevel(@"INFO", @"%@ cleaned %@.", self.name, [pet name]);
        });
    }
}

- (void)cleanPet:(id)pet {
    if ([self.pets containsObject:pet]) {
        [pet clean];
        LogWithLevel(@"INFO", @"%@ cleaned %@.", self.name, [pet name]);
    }
}

 -(void)playWithPet:(id)pet {
    if ([self.pets containsObject:pet]) {
        [pet play];
        LogWithLevel(@"DEBUG", @"%@ played with %@.", self.name, [pet name]);
    }
}

 -(void)listPets {
    if (self.pets.count == 0) {
        LogWithLevel(@"INFO", @"%@ has no pets.", self.name);
        return;
    }
    LogWithLevel(@"INFO", @"%@'s pets:", self.name);
    for (id pet in self.pets) {
        LogWithLevel(@"INFO", @"- %@ the %@ (Hunger: %ld, Cleanliness: %ld)", [pet name], [pet species], (long)[pet hungerLevel], (long)[pet cleanliness]);
    }
}

@end
