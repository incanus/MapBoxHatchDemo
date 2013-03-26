//
//  HDViewController.m
//  Hatch Demo
//
//  Created by Justin R. Miller on 3/26/13.
//  Copyright (c) 2013 MapBox. All rights reserved.
//

#import "HDViewController.h"

#import <MapBox/MapBox.h>

@interface HDViewController () <RMMapViewDelegate>

@end

#pragma mark -

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:[[RMMapBoxSource alloc] initWithMapID:@"justin.map-yr5ujtw3"]];

    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    mapView.zoom = 14;

    [self.view addSubview:mapView];

    mapView.delegate = self;

    RMAnnotation *annotation = [RMAnnotation annotationWithMapView:mapView coordinate:CLLocationCoordinate2DMake(38.918685, -77.052956) andTitle:nil];

    [mapView addAnnotation:annotation];
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;

    RMShape *shape = [[RMShape alloc] initWithView:mapView];

    [shape addLineToCoordinate:CLLocationCoordinate2DMake(38.918685, -77.052956)];
    [shape addLineToCoordinate:CLLocationCoordinate2DMake(38.902856, -77.053642)];
    [shape addLineToCoordinate:CLLocationCoordinate2DMake(38.900652, -77.038279)];
    [shape addLineToCoordinate:CLLocationCoordinate2DMake(38.887893, -77.020855)];
    [shape addLineToCoordinate:CLLocationCoordinate2DMake(38.900318, -77.005835)];
    [shape addLineToCoordinate:CLLocationCoordinate2DMake(38.908267, -77.018623)];
    [shape addLineToCoordinate:CLLocationCoordinate2DMake(38.923025, -77.005835)];
    [shape addLineToCoordinate:CLLocationCoordinate2DMake(38.923960, -77.029438)];
    [shape closePath];

    shape.lineColor = [UIColor clearColor];

    UIImage *hatchImage = [UIImage imageNamed:@"hatch.png"];

    CGRect rect = CGRectMake(0, 0, hatchImage.size.width, hatchImage.size.height);

    UIGraphicsBeginImageContext(rect.size);

    CGContextRef c = UIGraphicsGetCurrentContext();

    CGContextDrawImage(c, rect, [hatchImage CGImage]);

    CGContextSetBlendMode(c, kCGBlendModeSourceIn);

    CGContextSetFillColorWithColor(c, [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.5] CGColor]);
    CGContextFillRect(c, rect);

    shape.fillPatternImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    return shape;
}

@end