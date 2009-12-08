//
//  camera_viewAppDelegate.m
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//  Copyright ucsb 2009. All rights reserved.
//

#import "camera_viewAppDelegate.h"
#import "MainViewController.h"

@implementation camera_viewAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
