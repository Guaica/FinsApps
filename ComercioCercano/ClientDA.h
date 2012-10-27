//
//  ClientDA.h
//  ComercioCercano
//
//  Created by iOS on 26/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClientDA : NSObject

- (BOOL)saveClient:(NSDictionary*)clientDictionary;
- (BOOL)LoginUser:(NSString*)user withPassword:(NSString*)password;
- (NSDictionary*)getClientWithToken:(NSString*)token;

@end
