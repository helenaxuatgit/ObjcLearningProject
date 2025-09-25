#import <Foundation/Foundation.h>

typedef struct {
    NSString *name;
    int age;
    NSString *sex;
    int height;
    int weight;
} Person;



// Function to calculate mean height by sex
double meanHeightBySex(Person *people, int count, NSString *sex) {
    int sum = 0;
    int n = 0;
    for (int i = 0; i < count; i++) {
        if ([people[i].sex isEqualToString:sex]) {
            sum += people[i].height;
           // #import <Foundation/Foundation.h>

            n++;
        }
    }
    return n > 0 ? (double)sum / n : 0.0;
}

// Function to calculate mean height for all
double meanHeightAll(Person *people, int count) {
    int sum = 0;
    for (int i = 0; i < count; i++) {
        sum += people[i].height;
    }
    return count > 0 ? (double)sum / count : 0.0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Read CSV file
        NSString *csvPath = @"BigClass.csv";
        NSError *error = nil;
        NSString *csvContent = [NSString stringWithContentsOfFile:csvPath encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            NSLog(@"Failed to read CSV: %@", error);
            return 1;
        }
        NSArray *lines = [csvContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSMutableArray *peopleArray = [NSMutableArray array];
        for (NSUInteger i = 1; i < lines.count; i++) { // skip header
            NSString *line = lines[i];
            if ([line length] == 0) continue;
            NSArray *fields = [line componentsSeparatedByString:@","];
            if (fields.count < 6) continue;
            NSString *name = [fields[1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            int age = [fields[2] intValue];
            NSString *sex = [fields[3] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            int height = [fields[4] intValue];
            int weight = [fields[5] intValue];
            Person p = {name, age, sex, height, weight};
            [peopleArray addObject:[NSValue valueWithBytes:&p objCType:@encode(Person)]];
        }
        int peopleCount = (int)[peopleArray count];
        Person *people = malloc(sizeof(Person) * peopleCount);
        for (int i = 0; i < peopleCount; i++) {
            [peopleArray[i] getValue:&people[i]];
        }

        // Prompt for name
        char input[100];
        printf("Enter Name: ");
        if (fgets(input, sizeof(input), stdin) != NULL) {
            // Remove newline
            size_t len = strlen(input);
            if (len > 0 && input[len-1] == '\n') input[len-1] = '\0';
            NSString *searchName = [NSString stringWithUTF8String:input];
            BOOL found = NO;
            for (int i = 0; i < peopleCount; i++) {
                if ([people[i].name isEqualToString:searchName]) {
                    printf("%s %d %s %d %d\n",
                        [people[i].name UTF8String],
                        people[i].age,
                        [people[i].sex UTF8String],
                        people[i].height,
                        people[i].weight);
                    found = YES;
                    break;
                }
            }
            if (!found) {
                printf("Not found\n");
            }
        }

    // Calculate and print mean heights
    double meanF = meanHeightBySex(people, peopleCount, @"F");
    double meanM = meanHeightBySex(people, peopleCount, @"M");
    double meanAll = meanHeightAll(people, peopleCount);
    printf("Mean Height (F): %.2f\n", meanF);
    printf("Mean Height (M): %.2f\n", meanM);
    printf("Mean Height (All): %.2f\n", meanAll);
    free(people);
    }
    return 0;
}
