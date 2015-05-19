//
//  FISAppDelegate.m
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/14/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (NSString *)shortenLocationNameWithLocation:(NSDictionary *)location
                                      ToCount:(NSInteger)count
{
    NSString *locationName = location[@"name"];
    if (count >= 0) {
        return [locationName substringToIndex:count];
    }
    return locationName;
}

- (NSDictionary *)createLocationWithName:(NSString *)location
                                Latitude:(NSNumber *)latitude
                               Longitude:(NSNumber *)longitude
{
    NSDictionary *locationDictionary = @{@"name":location,
                                         @"latitude":latitude,
                                         @"longitude":longitude};
    return locationDictionary;
}

- (NSArray *)getLocationNamesWithLocations:(NSArray *)locations
{
    NSMutableArray *locationNamesArray = [@[] mutableCopy];
    for (NSDictionary *location in locations) {
        [locationNamesArray addObject:location[@"name"]];
    }
    return [locationNamesArray copy];
}

- (BOOL)verifyLocation:(NSDictionary *)location
{
    if ([location count] == 3) {
        if ([location[@"name"] isEqualToString:@"Empire State Building"] &&
            [location[@"latitude"] isEqualToNumber:@23.432] &&
            [location[@"longitude"] isEqualToNumber:@-34.34]) {
            return YES;
        } else if ([location[@"name"] isEqualToString:@"The Flatiron School"] &&
                   [location[@"latitude"] isEqualToNumber:@34.432] &&
                   [location[@"longitude"] isEqualToNumber:@-23.67]) {
            return YES;
        } else if ([location[@"name"] isEqualToString:@"Statue Of Liberty"] &&
                   [location[@"latitude"] isEqualToNumber:@78.34] &&
                   [location[@"longitude"] isEqualToNumber:@92.42]) {
            return YES;
        }
    }
    return NO;
}

- (NSDictionary *)searchForLocationName:(NSString *)location
                            inLocations:(NSArray *)locations
{
    for (NSDictionary *locationDictionary in locations) {
        if ([locationDictionary[@"name"] isEqualToString:location]) {
            return locationDictionary;
        }
    }
    return nil;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
