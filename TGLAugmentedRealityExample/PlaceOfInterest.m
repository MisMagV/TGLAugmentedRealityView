//
//  PlaceOfInterest.m
//  TGLAugmentedRealityExample
//
//  Created by Tim Gleue on 21.10.13.
//  Copyright (c) 2015 Tim Gleue ( http://gleue-interactive.com )
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "PlaceOfInterest.h"

@implementation PlaceOfInterest

+ (instancetype)placeOfInterestWithPlacemark:(CLPlacemark *)placemark {
    
	return [[PlaceOfInterest alloc] initWithPlacemark:placemark];
}

- (instancetype)initWithPlacemark:(CLPlacemark *)placemark {
    
    self = [super init];
    
    if (self) {
    
        _placemark = placemark;
    }
    
    return self;
}

#pragma mark - MKAnnotation protocol

- (CLLocationCoordinate2D)coordinate {

    return self.placemark.location.coordinate;
}

#pragma mark - TGLAROverlay protocol

- (void)setOverlayView:(TGLARViewOverlay *)overlayView {
    
    _overlayView = overlayView;
    
    self.overlayView.overlay = self;
}

- (void)setOverlayShape:(TGLARShapeOverlay *)overlayShape {
    
    _overlayShape = overlayShape;
    
    self.overlayShape.overlay = self;
}

@end
