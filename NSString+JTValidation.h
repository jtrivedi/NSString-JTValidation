//  NSString+JTValidation.h
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

#import <Foundation/Foundation.h>

@interface NSString (JTValidation)

// Returns true if the string's length is greater than or equal to the specified length.
- (BOOL)minimumLength:(int)length;

// Returns true if the string's length is less than or equal to the specified length.
- (BOOL)maximumLength:(int)length;

// Returns true if the string's length is the specified length.
- (BOOL)isExactLength:(int)length;

// Returns true if the string contains only alphabetical characters.
- (BOOL)isAlpha;

// Returns true if the string contains only alphanumeric characters.
- (BOOL)isAlphaNumeric;

// Returns true if the string contains only alphanumeric characters, including dash and underscore.
- (BOOL)isAlphaDash;

// Returns true if the string contains the specified string.
- (BOOL)containsString:(NSString *)string;

// Returns true if the string contains whitespace.
- (BOOL)containsWhitespace;

// Returns true if the string is a valid number.
- (BOOL)isNumeric;

// Returns true if the string is an integer.
- (BOOL)isInteger;

// Returns true if the string is a valid email address. 
- (BOOL)isValidEmail;

@end
