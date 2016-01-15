//
//  PhotoDetailViewController.m
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//

#import "PhotoDetailViewController.h"

@interface PhotoDetailViewController ()

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.photo.title;
    //self.photoImageView.image = self.photo.thumbnail;
    
    NSData *imageData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:self.photo.detailPhotoUrl]
                                               options:0  error:nil];
    
    //[NSData dataWithContentsOfURL:self.photo.photoUrl];
    self.photoImageView.image = [UIImage imageWithData:imageData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
