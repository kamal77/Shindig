//
//  FlickrDownloadDelegate.h
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FlickrDownloadDelegate <NSObject>

-(void) finishedDownloadingFlickrPhoto: (NSMutableArray *)photos;

@end
