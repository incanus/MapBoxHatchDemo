//
//  HDViewController.m
//  Hatch Demo
//
//  Created by Justin R. Miller on 3/26/13.
//  Copyright (c) 2013 MapBox. All rights reserved.
//

#import "HDViewController.h"

#import <MapBox/MapBox.h>

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:[[RMMapView alloc] initWithFrame:self.view.bounds]];
}

@end