#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "MTGCardSetsRequest.h"

SpecBegin(MTGCardSetsRequest)

describe(@"MTGCardSetsRequest", ^{
    __block MTGCardSetsRequest *request;
    
    beforeEach(^{
        request = [[MTGCardSetsRequest alloc] init];
    });
    
    it(@"does not blow up", ^{
        expect(request).notTo.beNil();
    });
    
    it(@"has the correct path", ^{
        expect(request.path).to.equal(@"/sets");
    });
    
    it(@"has the correct path", ^{
        expect(request.parameters).to.beNil();
    });
    
    it(@"has the correct response serialzation", ^{
        expect(request.responseSerializer).to.equal(MTGResponseSerializerSets);
    });
});

SpecEnd
