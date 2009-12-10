//
//  CameraViewDelegate.h
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//  Copyright 2009 ucsb. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CameraViewDelegate : NSObject <UIActionSheetDelegate> {
  UIViewController *viewController;
}

@property (nonatomic, retain) UIViewController *viewController;

- (void)showActionSheet;

@end
