//
//  MainViewController.h
//  camera-view
//
//  Created by Chad Berkley on 12/8/09.
//  Copyright ucsb 2009. All rights reserved.
//

#import "FlipsideViewController.h"
#import "CameraViewProtocol.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, CameraViewProtocol> {
}

- (IBAction)showInfo;

@end
