//
//  CameraViewDelegate.m
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//  Copyright 2009 ucsb. All rights reserved.
//

#import "CameraViewDelegate.h"


@implementation CameraViewDelegate

- (void)showActionSheet:(UIView *)view
{
	UIActionSheet *popupQuery = [[UIActionSheet alloc]
															 initWithTitle:@"Choose an Action"
															 delegate:self
															 cancelButtonTitle:@"Cancel"
															 destructiveButtonTitle:nil
															 otherButtonTitles:@"Take a Video",@"Choose a Video",nil];
	
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	[popupQuery showInView:view];
	[popupQuery release];
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"Clicking button %i", buttonIndex);
	
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
