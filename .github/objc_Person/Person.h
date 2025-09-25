#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic, strong) NSString *occupation;

@property (nonatomic, strong) NSMutableArray *pets; // Array of Pet

- (void)addPet:(id)pet;
- (void)feedPet:(id)pet;
- (void)cleanPet:(id)pet;
- (void)playWithPet:(id)pet;
- (void)listPets;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age occupation:(NSString *)occupation;
- (void)greet;
- (void)haveBirthday;
- (void)changeOccupation:(NSString *)newOccupation;
@end
