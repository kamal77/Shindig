//
//  PhotoDetailViewController.h
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"

@interface PhotoDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (nonatomic, strong) FlickrPhoto *photo;

@end
