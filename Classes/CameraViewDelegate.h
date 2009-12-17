//
//  CameraViewDelegate.h
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//

#import <UIKit/UIKit.h>

@protocol CameraViewProtocol

- (void)didFinishPickingVideo:(NSURL *)url;

@end


@interface CameraViewDelegate : NSObject <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
  UIViewController *viewController;
	id <CameraViewProtocol> delegate;
}

@property (nonatomic, retain) UIViewController *viewController;
@property(nonatomic,assign) id <CameraViewProtocol> delegate;


- (BOOL)showActionSheet;

@end
