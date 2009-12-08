//
//  camera_viewAppDelegate.h
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//  Copyright ucsb 2009. All rights reserved.
//

@class MainViewController;

@interface camera_viewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

