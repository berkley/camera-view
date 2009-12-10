//
//  CameraViewDelegate.m
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//  Copyright 2009 ucsb. All rights reserved.
//

#import "CameraViewDelegate.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation CameraViewDelegate

@synthesize viewController;

- (void)showActionSheet
{
	UIActionSheet *popupQuery = [[UIActionSheet alloc]
															 initWithTitle:@"Choose an Action"
															 delegate:self
															 cancelButtonTitle:@"Cancel"
															 destructiveButtonTitle:nil
															 otherButtonTitles:@"Take a Video",@"Choose a Video",nil];
	
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	[popupQuery showInView:viewController.view];
	[popupQuery release];
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"Clicking button %i", buttonIndex);
	if(buttonIndex == 0)
	{ //take a video
		BOOL camAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
		if(!camAvailable)
		{
			NSLog(@"No camera installed on device.");
			return;
		}
		//check if the media type is available
		NSArray *availableSourceTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
		if(![availableSourceTypes containsObject:(NSString *) kUTTypeMovie])
		{
			NSLog(@"Camera not capable of video.");
			return;
		}

		UIImagePickerController *picker = [[UIImagePickerController alloc]init];
		//Note: Important!!!! You must enable the MobileCoreServices.framework for this to work!!
		picker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		[picker.view sizeToFit];
		//do this when we want to get the photo file that is created
		//picker.delegate = self;
		[viewController.view addSubview:picker.view];
		[viewController presentModalViewController:picker animated:YES];		
	}
	else if(buttonIndex == 1)
	{ //choose a video
		BOOL camLibAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
		if(!camLibAvailable)
		{
			NSLog(@"No camera installed on device.");
			return;
		}
		
		UIImagePickerController *picker = [[UIImagePickerController alloc]init];
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		//picker.delegate = view;
		[picker.view sizeToFit];
		[viewController.view addSubview:picker.view];
		[viewController presentModalViewController:picker animated:YES];
	}
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
	
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
	
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
