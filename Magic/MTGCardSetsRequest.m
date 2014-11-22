#import "MTGCardSetsRequest.h"

@implementation MTGCardSetsRequest

#pragma mark - Request

- (NSString *)path
{
    return @"/sets";
}

- (MTGResponseSerializer)responseSerializer
{
    return MTGResponseSerializerSets;
}

@end
