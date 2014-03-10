//
//  GENViewController.m
//  FilteredPreview
//
//  Created by Beckermao on 1/24/14.
//  Copyright (c) 2014 Erik Jefferson. All rights reserved.
//

#import "GENViewController.h"
#import "GPUImage.h"

@interface GENViewController ()

@property GPUImageVideoCamera *videoCamera;

@end

@implementation GENViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionFront];
    self.videoCamera.horizontallyMirrorFrontFacingCamera = YES;
    self.videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    //GPUImageFilter *customFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromFile:@"CustomShader"];
    GPUImageView *filteredVideoView = [[GPUImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    // set our main view to be the GPUImage view
    self.view = filteredVideoView;
    
    [self.videoCamera addTarget:filteredVideoView];
    //[self.videoCamera addTarget:customFilter];
    //[customFilter addTarget:filteredVideoView];
    
    [self.videoCamera startCameraCapture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
