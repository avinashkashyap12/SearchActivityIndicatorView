//
//  SearchActivityIndicatorView.h
//  SearchActivityIndicatorViewSample
//
//  Created by Avinash Kashyap on 10/9/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)

@interface SearchActivityIndicatorView : UIView
{
    CGFloat maxScale, minScale;
}
@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) NSTimeInterval animationDuration;

-(void) startSearching;
-(void) stopSearching;
@end
