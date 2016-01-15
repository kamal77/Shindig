//
//  PhotoGalleryController.m
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//

#import "PhotoGalleryController.h"
#import "FlickrSearchService.h"
#import "ThumbnailTableViewCell.h"
#import "FlickrPhoto.h"
#import "PhotoDetailViewController.h"

@interface PhotoGalleryController ()

@property (nonatomic, strong) FlickrSearchService *flickrService;
@property (nonatomic, strong) NSArray *photos;

@end

@implementation PhotoGalleryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flickrService = [[FlickrSearchService alloc] init];
    self.flickrService.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate (protocol implementation) methods

-(void) finishedDownloadingFlickrPhoto:(NSMutableArray *)flickrphotos {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        self.photos = flickrphotos;
        [self.tableView reloadData];
    });
   
}

#pragma mark - Search functions

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"In here...");
    [self.flickrService searchPhotos:searchBar.text];
    [searchBar resignFirstResponder];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (self.photos.count > 0) ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.photos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ThumbnailViewCell";
    ThumbnailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    FlickrPhoto *photo = (self.photos)[indexPath.row];
    /*NSData *imageData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:photo.photoUrl]
                                              options:0  error:nil];
    cell.photoImgView.image = [UIImage imageWithData:imageData]; */
    cell.titleLabel.text = photo.title;
    cell.photoImgView.image = photo.thumbnail;
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showPhotoDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FlickrPhoto *photo = [self.photos objectAtIndex:indexPath.row];
        PhotoDetailViewController *destViewController = segue.destinationViewController;
        destViewController.photo = photo;
    }
}


@end
