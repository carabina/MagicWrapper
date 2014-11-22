#import "MTGCardSet.h"

@interface MTGCardSet ()
@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, readwrite) NSInteger common;
@property (nonatomic, readwrite) NSInteger uncommon;
@property (nonatomic, readwrite) NSInteger rare;
@property (nonatomic, readwrite) NSInteger mythicRare;
@property (nonatomic, readwrite) NSInteger basicLand;
@property (nonatomic, readwrite) NSInteger total;
@property (nonatomic, strong, readwrite) NSString *identifier;
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *type;
@property (nonatomic, strong, readwrite) NSString *block;
@property (nonatomic, strong, readwrite) NSString *shortDescription;
@property (nonatomic, strong, readwrite) NSString *releasedAt;
@property (nonatomic, strong, readwrite) NSArray *cardIDs;
@end

@implementation MTGCardSet

#pragma mark - Initialization

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.dictionary = dictionary;
        self.identifier = dictionary[@"id"];
        self.name = dictionary[@"name"];
        self.type = dictionary[@"type"];
        self.block = dictionary[@"block"];
        self.shortDescription = dictionary[@"description"];
        self.common = [dictionary[@"common"] integerValue];
        self.uncommon = [dictionary[@"uncommon"] integerValue];
        self.rare = [dictionary[@"rare"] integerValue];
        self.mythicRare = [dictionary[@"mythicRare"] integerValue];
        self.basicLand = [dictionary[@"basicLand"] integerValue];
        self.total = [dictionary[@"total"] integerValue];
        self.cardIDs = dictionary[@"cardIds"];
        self.releasedAt = dictionary[@"releasedAt"];
    }
    
    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString string];
    
    [description appendFormat:@"<MTGCardSet: %p", self];
    [description appendFormat:@", name: %@", self.name];
    [description appendFormat:@", id: %@", self.identifier];
    [description appendFormat:@", type: %@", self.type];
    [description appendFormat:@", n. cards: %@", @(self.total)];
    [description appendFormat:@">"];
    
    return description.copy;
}

#pragma mark - Equality & Identity

- (BOOL)isEqual:(id)object
{
    if (object == self) return YES;
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    return [self isEqualCardSet:object];
}

- (BOOL)isEqualCardSet:(MTGCardSet *)other
{
    return [self.identifier isEqualToString:other.identifier];
}

- (NSUInteger)hash
{
    return [self.identifier hash] ^ [self.releasedAt hash];
}

@end
