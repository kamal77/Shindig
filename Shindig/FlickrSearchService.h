//
//  NSObject+FlickrSearchService.h
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrDownloadDelegate.h"

@interface FlickrSearchService : NSObject

@property (nonatomic, assign) id<FlickrDownloadDelegate> delegate;

-(void)searchPhotos:(NSString *)text;

@end