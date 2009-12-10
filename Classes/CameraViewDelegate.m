//
//  CameraViewDelegate.m
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//
//Note: Important!!!! You must enable the MobileCoreServices.framework for this to work!!
//
//From the API Docs: The maximum duration for a video recording is 10 minutes. 

#import "CameraViewDelegate.h"
#import "CameraViewProtocol.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation CameraViewDelegate

@synthesize viewController;
@synthesize delegate;

/*
 * show the action sheet
 */
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

/*
 * handle the action sheet button clicks
 */
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"Clicking button %i", buttonIndex);
	if(buttonIndex == 0)
	{ //take a video
		[self handleShowCamera];
	}
	else if(buttonIndex == 1)
	{ //choose a video
		[self handleShowLibrary];
	}
}

/*
 * let the user take a video
 */
- (void)handleShowCamera
{
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
	picker.delegate = self;
	[viewController.view addSubview:picker.view];
	[viewController presentModalViewController:picker animated:YES];
}

/*
 * let the user pick a video
 */
- (void)handleShowLibrary
{
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

/*
 * Handle getting the taken video 
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	NSLog(@"Done picking image.");
	NSURL *url = [info valueForKey:UIImagePickerControllerMediaURL]; 
	[self.delegate didFinishPickingVideo:url];
	[viewController dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [super dealloc];
}


@end
