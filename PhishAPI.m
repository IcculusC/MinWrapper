//
//  PhishAPI.m
//  PhishWrapper
//
//  Created by Leath Cooper on 2/21/13.
//  Copyright (c) 2013 Leath Cooper. All rights reserved.
//

#import "PhishAPI.h"

@implementation PhishAPI

@synthesize delegate;
@synthesize baseURL;

- (id)initWithMethod:(NSString *)methodName arguments:(NSString *)args keyed:(BOOL)keyed sender:(id)sender;
{
    
    NSString * apikey = @"removedMyAPIKey";
    
    self = [super init];
    
    if(self)
    {
        method = methodName;
        json = [[NSMutableData alloc] init];
        baseURL = @"https://api.phish.net/api.js?method=";
        baseURL = [baseURL stringByAppendingString:methodName];
        
        if(keyed)
            baseURL = [baseURL stringByAppendingString:[[NSString alloc] initWithFormat:@"&apikey=%@&", apikey]];
        else
            baseURL = [baseURL stringByAppendingString:@"&"];
        
        baseURL = [baseURL stringByAppendingString:args];
        
        NSLog(@"%@", baseURL);
        delegate = sender;
    }
    
    return self;
}

- (void)fetchData
{
    NSURL * url = [NSURL URLWithString:baseURL];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    [json appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if(delegate)
        [delegate gotData:json method:method];
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    if(delegate)
        [delegate connFailed:error];
}

@end