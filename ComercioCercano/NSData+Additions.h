//
//  NSData+Additions.h
//  finnapp
//
//  Created by Guaica on 26/10/12.
//  Copyright (c) 2012 Guaica. All rights reserved.
//

@interface NSData (MBBase64)

+ (id)dataWithBase64EncodedString:(NSString *)string;     //  Padding '=' characters are optional. Whitespace is ignored.
- (NSString *)base64Encoding;

@end

