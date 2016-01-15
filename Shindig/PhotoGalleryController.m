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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
