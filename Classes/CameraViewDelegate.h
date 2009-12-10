//
//  CameraViewDelegate.h
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//

#import <UIKit/UIKit.h>
#import "CameraViewProtocol.h";

@interface CameraViewDelegate : NSObject <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
  UIViewController *viewController;
}

@property (nonatomic, retain) UIViewController *viewController;
@property(nonatomic,assign) id <CameraViewProtocol> delegate;


- (void)showActionSheet;

@end
