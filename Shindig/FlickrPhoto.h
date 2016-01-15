//
//  FlickrPhoto.h
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlickrPhoto : NSObject

@property (strong, nonatomic) NSString *photoId; //may be integer but for now using string
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *farmId;  //may be integer but for now using string
@property (strong, nonatomic) NSString *secretId;
@property (strong, nonatomic) NSString *serverId;
@property (strong, nonatomic) NSString *photoUrl;
@property (strong, nonatomic) NSString *detailPhotoUrl;


@end
