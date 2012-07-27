//
//  ValidatorUnitTests.m
//  US2FormValidatorUnitTests
//
//  Copyright (C) 2012 ustwo™
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//  

#import "ValidatorUnitTests.h"
#import "US2Validator.h"
#import "US2ConditionAlphabetic.h"
#import "US2ConditionRange.h"


@implementation ValidatorUnitTests


- (void)setUp
{
    [super setUp];
    
    _validator = [[US2Validator alloc] init];
}

- (void)tearDown
{
    [_validator release];
    _validator = nil;
    
    [super tearDown];
}

/**
 Test US2Validator class.
 
 (1) Create conditions
 (2) Add conditions to validator
 (3) Test completely valid string
 (3) Test partially valid string
 (4) Test invalid string
 */
- (void)testValidator
{
    // Test for existing validator
    STAssertNotNil(_validator, @"Validator instance must not be nil", nil);
    
    // Create first condition
    US2ConditionAlphabetic *condition1 = [[US2ConditionAlphabetic alloc] init];
    
    // Create second condition
    US2ConditionRange *condition2 = [[US2ConditionRange alloc] init];
    condition2.range = NSMakeRange(3, 12);
    
    // Create string to test
    NSString *successTestString1 = @"abcdefgh";
    NSString *failureTestString1 = @"ab";
    NSString *failureTestString2 = @"12";
    
    // Add first condition to validator
    [_validator addCondition:condition1];
    [condition1 release];
    [_validator addCondition:condition2];
    [condition2 release];
    
    US2ConditionCollection *collection = nil;
    collection = [_validator checkConditions:successTestString1];
    STAssertNil(collection, @"Collection must be nil", nil);
    
    collection = [_validator checkConditions:failureTestString1];
    STAssertNotNil(collection, @"Collection must not be nil", nil);
    
    collection = [_validator checkConditions:failureTestString2];
    STAssertNotNil(collection, @"Collection must not be nil", nil);
}


@end
