//
//  PhishAPIDelegate.h
//  PhishWrapper
//
//  Created by Leath Cooper on 3/3/13.
//  Copyright (c) 2013 Leath Cooper. All rights reserved.
//	
//	I used this delegate system to circumvent the way 
//  NSURLConnection gathers data.
//

#import <Foundation/Foundation.h>

@protocol PhishAPIDelegate <NSObject>

@required
- (void)gotData:(NSData *)dat method:(NSString *)method;

@required
- (void)connFailed:(NSError *)err;

@end