#import <Foundation/Foundation.h>
#import "Person.h"

#import "Pet.h"
#import "Dog.h"
#import "Cat.h"
#import "Bird.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *startTime = [NSDate date];
        // Generate log file name with date and time in 'log' folder
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyyMMdd_HHmmss"];
        NSString *dateString = [formatter stringFromDate:[NSDate date]];
        NSString *logDir = @"Log";
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:logDir]) {
            [fileManager createDirectoryAtPath:logDir withIntermediateDirectories:YES attributes:nil error:nil];
        }
        NSString *logFileName = [NSString stringWithFormat:@"%@/log_%@.txt", logDir, dateString];
        freopen([logFileName UTF8String], "a+", stderr);
        // Create a Person object
        Person *student = [[Person alloc] initWithName:@"Alex" age:20 occupation:@"Student"];
    LogWithLevel(@"INFO", @"--- Program started ---");
    [student greet];
    [student haveBirthday];
    [student changeOccupation:@"Software Engineer"];
    [student greet];
    

    // Create some pets using subclasses
    Dog *dog = [[Dog alloc] initWithName:@"Buddy" species:@"Dog"];
    Cat *cat = [[Cat alloc] initWithName:@"Whiskers" species:@"Cat"];
    Bird *bird = [[Bird alloc] initWithName:@"Tweety" species:@"Bird"];

    // Add pets to person
    [student addPet:dog];
    [student addPet:cat];
    [student addPet:bird];

    // List pets
    [student listPets];

    // Play with pets
    [student playWithPet:dog];
    [student playWithPet:cat];
    [student playWithPet:bird];

    // Feed and clean pets
    [student feedPet:dog];
    [student cleanPet:cat];
    [student feedPet:bird];
    [student feedPet:dog];
    [student feedPet:dog];
    [student feedPet:dog];
    // Make pets make sounds (demonstrate override)
    [dog makeSound];
    [cat makeSound];
    [bird makeSound];

    // Use unique methods
    [dog fetch];
    [cat scratch];
    [bird fly];

    // List pets again to see updated status
    [student listPets];

    LogWithLevel(@"INFO", @"--- Program finished ---");
    // Log total errors
    LogWithLevel(@"INFO", @"Total errors during run: %d", gErrorCount);
    //log total time used
    NSTimeInterval elapsed = [[NSDate date] timeIntervalSinceDate:startTime];
    LogWithLevel(@"INFO", @"Total time used: %.3f seconds", elapsed);
    }
    return 0;
}


