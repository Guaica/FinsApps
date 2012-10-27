//
//  ClientDA.m
//  ComercioCercano
//
//  Created by iOS on 26/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import "ClientDA.h"
#import "NSData+Additions.h"

@implementation ClientDA

- (NSString*)wsURL
{
    return [NSString stringWithFormat:@"%@%@", kAPIUrl, kAPIKey];
}

- (BOOL)LoginUser:(NSString*)user withPassword:(NSString*)password
{
    __block BOOL access = FALSE;
    NSString *baseUrl = [NSString stringWithFormat:@"http://finappsapi.bdigital.org/api/2012/973a9a0add/access/login"];
    
    NSURL *url = [NSURL URLWithString:[baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", user, password];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];
    [urlRequest setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    
    NSError        *error = nil;
    NSURLResponse  *response = nil;
    
    NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response  error:&error];
    
    if (!error)
    {
                 NSDictionary* json = [NSJSONSerialization
                                       JSONObjectWithData:newData //1
                                       options:kNilOptions
                                       error:&error];
                 NSLog(@"%@", json);
                 NSString *token = [json objectForKey:@"token"];
                 if (token != nil && ![token isEqualToString:@""])
                 {
                     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                     [defaults setValue:token forKey:@"token"];
                     access = TRUE;
                 }

    }
    return access;
}

- (BOOL)saveClient:(NSDictionary*)clientDictionary
{
    NSString *baseUrl = [NSString stringWithFormat:@"%@/access/client", [self wsURL]];
    NSURL *url = [NSURL URLWithString:baseUrl];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    NSError *error = nil;
    
    NSData *postdata = [NSJSONSerialization dataWithJSONObject:clientDictionary options:NSJSONWritingPrettyPrinted error:&error];
    [urlRequest setHTTPBody:postdata];
    
    NSURLResponse *response = nil;
    NSData *data = nil;
    
    data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];//Eniamos la petición a l servidor que nos retorna datos que posteriormente parsearemos
    
    if([data length] > 0 && error == nil)
    {
        NSDictionary *resDict = nil;
        if([data length] > 0 && error == nil)
            {
                NSError *jsonError = nil;
                id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                if(jsonObject != nil && jsonError == nil)
                    {
                        if([jsonObject isKindOfClass:[NSDictionary class]])
                        {
                            resDict = (NSDictionary*)jsonObject;
                        }
                }
        }
    }
    return NO;
}

- (NSDictionary*)getClientWithToken:(NSString*)token
{
    __block NSDictionary *json = nil;
    
    NSString *baseUrl = [NSString stringWithFormat:@"http://finappsapi.bdigital.org/api/2012/973a9a0add/%@/operations/client/profile/@me", token];
    
    NSURL *url = [NSURL URLWithString:[baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = nil;
    NSURLResponse *response = nil;
    
    NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response  error:&error];
    
    if (!error)
    {
        json = [NSJSONSerialization
                              JSONObjectWithData:newData //1
                              options:kNilOptions
                              error:&error];
    }
    return json;
}

@end
