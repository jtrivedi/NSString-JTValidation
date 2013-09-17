//  NSString+JTValidation.m
//
// The MIT License (MIT)
//
// Copyright (c) 2013 Janum Trivedi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSString+JTValidation.h"

@implementation NSString (JTValidation)

- (BOOL)minimumLength:(int)length {
    return (self.length >= length);
}

- (BOOL)maximumLength:(int)length {
    return (self.length >= length);
}

- (BOOL)isExactLength:(int)length {
    return (self.length == length);
}

- (BOOL)isAlpha {
    NSCharacterSet* alphaCharacters = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    alphaCharacters = [alphaCharacters invertedSet];
    
    if ([self containsCharactersInSet:alphaCharacters inputString:self]) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)isAlphaNumeric {
    NSCharacterSet* alphaCharacters = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"];
    alphaCharacters = [alphaCharacters invertedSet];
    
    if ([self containsCharactersInSet:alphaCharacters inputString:self]) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)isAlphaDash {
    NSCharacterSet* alphaCharacters = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-"];
    alphaCharacters = [alphaCharacters invertedSet];
    
    if ([self containsCharactersInSet:alphaCharacters inputString:self]) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)containsString:(NSString *)string {
    if ([self rangeOfString:string].location != NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)containsWhitespace {
    return [self containsString:@" "];
}

- (BOOL)isNumeric {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setAllowsFloats:YES];
    if ([formatter numberFromString:self]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isInteger {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setAllowsFloats:NO];
    if ([formatter numberFromString:self]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isValidEmail {
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)containsCharactersInSet:(NSCharacterSet *)characterSet inputString:(NSString *)inputString {
    NSRange range = [inputString rangeOfCharacterFromSet:characterSet];
    if (range.location != NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

@end
