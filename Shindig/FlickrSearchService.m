//
//  NSObject+FlickrSearchService.m
//  Shindig
//
//  Created by Kamalakar Thota on 1/15/16.
//  Copyright © 2016 KamalFlik. All rights reserved.
//

#import "FlickrSearchService.h"
#import "FlickrPhoto.h"

@implementation FlickrSearchService

static NSString *const ApiKey = @"1dd17dde0fed7286935d83875fcc17dd";
static NSString *const BaseUrl = @"https://api.flickr.com/services/rest/";
static NSString *const MethodUriParam = @"flickr.photos.search";
static NSString *const PerPage = @"25";
static NSString *const FormatType = @"json";
static NSString *const NoJsonCallBack = @"1";


#pragma mark - service communications

-(void)searchPhotos:(NSString *)text{
    // Build the string to call the Flickr API
    NSString *urlString = [NSString stringWithFormat:@"%@/?method=%@&api_key=%@&tags=%@&per_page=%@&format=%@&nojsoncallback=%@", BaseUrl, MethodUriParam, ApiKey, text, PerPage, FormatType,NoJsonCallBack ];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:urlString]];
    //This method is deprecated from ios9 and I will replace it. I usually use RestKit.
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               [self parseFlickerResponseData:data];
                           }];
}

-(void) parseFlickerResponseData: (NSData *)responseJsonData {
    
    NSError *error = nil;
    NSDictionary *searchResultsDict = [NSJSONSerialization JSONObjectWithData:responseJsonData
                                                                      options:kNilOptions
                                                                        error:&error];
    
    NSLog(@"dictionary: %@", searchResultsDict);
    //looks like there is a stat in the json response we could check for..
    if (error != nil) {
        //Do Something...
    }
    else {
        NSArray *objPhotos = searchResultsDict[@"photos"][@"photo"];
        NSMutableArray *flickrPhotos = [@[] mutableCopy];
        
        for (NSMutableDictionary *objPhoto in objPhotos) {
            FlickrPhoto *photo = [[FlickrPhoto alloc] init];
            photo.farmId = objPhoto[@"farm"];
            photo.serverId = objPhoto[@"server"] ;
            photo.secretId = objPhoto[@"secret"];
            photo.photoId = objPhoto[@"id"];
            photo.title = objPhoto[@"title"];
            // NSLog(@"title= %@",photo.photoUrl);
            // NSData *imageData = [NSData dataWithContentsOfURL:photo.photoUrl options:0 error:&error];
            
            
            NSData *imageData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:photo.photoUrl]
                                                       options:0  error:nil];
            photo.thumbnail = [UIImage imageWithData:imageData];
            
            [flickrPhotos addObject:photo];
        }
        
        [self.delegate finishedDownloadingFlickrPhoto:flickrPhotos];
        
    }
    
}

@end
