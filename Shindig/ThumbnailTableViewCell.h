//
//  ThumbnailTableViewCell.h
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThumbnailTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *photoImgView;

@end
