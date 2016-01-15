//
//  FlickrPhoto.m
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto


- (NSString *)photoUrl
{
    //refer to https://www.flickr.com/services/api/misc.urls.html
    NSString *urlPath = [NSString stringWithFormat: @"https://farm%@.staticflickr.com/%@/%@_%@_t.jpg", self.farmId, self.serverId, self.photoId, self.secretId];
    return urlPath;
}

- (NSString *)detailPhotoUrl
{
    //refer to https://www.flickr.com/services/api/misc.urls.html
    NSString *urlPath = [NSString stringWithFormat: @"https://farm%@.staticflickr.com/%@/%@_%@_b.jpg", self.farmId, self.serverId, self.photoId, self.secretId];
    return urlPath;
}


@end