//
//  TVHTagStoreTests.m
//  TVHeadend iPhone Client
//
//  Created by zipleen on 2/22/13.
//  Copyright (c) 2013 zipleen. All rights reserved.
//

#import "TVHTagStoreTests.h"
#import "TVHTestHelper.h"
#import "TVHTagStore.h"
#import "TVHTag.h"

@interface TVHTagStore (MyPrivateMethodsUsedForTesting)
@property (nonatomic, strong) NSArray *tags;
- (void)fetchedData:(NSData *)responseData;
@end

@implementation TVHTagStoreTests



- (void)testJsonTagsParsing
{
    NSData *data = [TVHTestHelper loadFixture:@"Log.tags"];
    TVHTagStore *store = [TVHTagStore sharedInstance];
    STAssertNotNil(store, @"creating tvhtag store object");
    
    [store fetchedData:data];
    STAssertTrue( ([store.tags count] == 13+1), @"Failed parsing json data");
    
    TVHTag *tag = [store.tags lastObject];
    STAssertEqualObjects(tag.name, @"Zon", @"tag name does not match");
    STAssertEquals(tag.tagid, 8, @"tag id doesnt match");
    
    tag = [store.tags objectAtIndex:0];
    STAssertEqualObjects(tag.name, @"All Channels", @"tag name does not match");
    STAssertEquals(tag.tagid, 0, @"tag id doesnt match");
    
    tag = [store.tags objectAtIndex:2];
    STAssertEqualObjects(tag.name, @"Desenhos Animados", @"tag name does not match");
    STAssertEquals(tag.tagid, 55, @"tag id doesnt match");
    STAssertEqualObjects(tag.imageUrl, @"http://infantil.png", @"tag id doesnt match");

}

@end