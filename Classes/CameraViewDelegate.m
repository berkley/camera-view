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
#import <MobileCoreServices/MobileCoreServices.h>

@implementation CameraViewDelegate

@synthesize viewController;
@synthesize delegate;

UIActionSheet *popupQuery;

/*
 * show the action sheet.
 * return false on an error (if the device does not have a camera capable of video)
 * return true if everything works ok
 */
- (BOOL)showActionSheet
{
	BOOL hasVideoCapableCamera = [self checkCameraForVideo];
	BOOL hasVideoLibrary = [self checkVideoLibrary];
	
	if(hasVideoLibrary && hasVideoCapableCamera)
	{
		popupQuery =[[UIActionSheet alloc]
										initWithTitle:@"Choose an Action"
										delegate:self
										cancelButtonTitle:@"Cancel"
										destructiveButtonTitle:nil
										otherButtonTitles:@"Choose a Video", @"Take a Video",nil];
	}
	else if(hasVideoLibrary && ! hasVideoCapableCamera)
	{
		popupQuery =[[UIActionSheet alloc]
								 initWithTitle:@"Choose an Action"
								 delegate:self
								 cancelButtonTitle:@"Cancel"
								 destructiveButtonTitle:nil
								 otherButtonTitles:@"Choose a Video",nil];
	}
	else
	{ //no vid cam and no library
		return false;
	}

	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	[popupQuery showInView:viewController.view];
	[popupQuery release];
	
	//everything is ok
	return true;
}

/*
 * handle the action sheet button clicks
 */
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"Clicking button %i", buttonIndex);
	NSInteger cancelIndex = popupQuery.cancelButtonIndex;
	if(cancelIndex != 1 && buttonIndex == 1)
	{ //take a video
		[self handleShowCamera];
	}
	else if(buttonIndex == 0)
	{ //choose a video
		[self handleShowLibrary];
	}
}

/*
 * let the user take a video
 */
- (void)handleShowCamera
{
		
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
	UIImagePickerController *picker = [[UIImagePickerController alloc]init];
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	picker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
	picker.delegate = self;
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

/*
 * check to see if this device is capable of browsing videos
 */
- (BOOL) checkVideoLibrary
{
	BOOL camLibAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
	if(!camLibAvailable)
	{
		NSLog(@"No video library on device.");
		return false;
	}
	return true;
}

/*
 * check to see if the camera is capable of video.  return false if it isn't
 */
- (BOOL) checkCameraForVideo
{
	BOOL camAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
	if(!camAvailable)
	{
		NSLog(@"No camera installed on device.");
		return false;
	}
	//check if the media type is available
	NSArray *availableSourceTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
	if(![availableSourceTypes containsObject:(NSString *) kUTTypeMovie])
	{
		NSLog(@"Camera not capable of video.");
		return false;
	}	
	return true;
}

- (void)dealloc {
    [super dealloc];
}


@end
