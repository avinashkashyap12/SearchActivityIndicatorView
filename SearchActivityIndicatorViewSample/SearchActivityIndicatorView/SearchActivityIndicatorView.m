//
//  SearchActivityIndicatorView.m
//  SearchActivityIndicatorViewSample
//
//  Created by Avinash Kashyap on 10/9/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import "SearchActivityIndicatorView.h"

static NSString * const kSearchScaleAnimationKey = @"kSearchScaleAnimationKey";

@interface SearchActivityIndicatorCircleView : UIView
{
    
}
@property (nonatomic, strong) UIColor *strokeColor;
@end

@implementation SearchActivityIndicatorView

-(instancetype) init{
    self = [super init];
    if (self) {
        [self initializeDefaultValues];
    }
    return self;
}
-(instancetype) initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeDefaultValues];
    }
    return self;
}
-(void) awakeFromNib{
    [super awakeFromNib];
    [self initializeDefaultValues];
}
-(void) initializeDefaultValues{
    //set animation suration
    self.animationDuration = 1.9f;
    //set default stroke color
    self.strokeColor = [UIColor redColor];
    //set minimum scale
    minScale = 0.3f;
    //set maximum scale
    maxScale = 8.0f;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void) startSearching{
    if (self.isAnimating) {
        return;
    }
    self.isAnimating = YES;
    [self addCircleSearchView];
}
-(void) addCircleSearchView{
    CGFloat width = MIN(self.frame.size.width, self.frame.size.height)/4;
    SearchActivityIndicatorCircleView *circleSearchView = [[SearchActivityIndicatorCircleView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    [circleSearchView setStrokeColor:self.strokeColor];
    circleSearchView.center = self.center;
    
    //Add CABasicAnimation for scale view
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //set animation duration time
    scaleAnimation.duration = self.animationDuration;
    //set repeat count to maximum
    scaleAnimation.repeatCount = CGFLOAT_MAX;
    //set minimum value for animation
    scaleAnimation.fromValue = @(minScale);
    //set maximum value for animation
    scaleAnimation.toValue = @(maxScale);
    //set timing function
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.6f :0.5f :0.2f :0.1f];//[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [circleSearchView.layer addAnimation:scaleAnimation forKey:kSearchScaleAnimationKey];
    [self addSubview:circleSearchView];
}
-(void) stopSearching{
    if(!self.isAnimating) {
        return;
    }
    for(UIView *searchView in self.subviews) {
        [UIView animateWithDuration:0.9f animations:^{
            searchView.transform = CGAffineTransformMakeScale(7.0f, 7.0f);
            [searchView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [searchView.layer removeAllAnimations];
            [searchView removeFromSuperview];
        }];
    }
    self.isAnimating = NO;
}
@end

@implementation SearchActivityIndicatorCircleView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void) drawRect:(CGRect)rect{
    //Drawing Code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:CGPointMake(self.bounds.size.width/2, self.frame.size.height/2) radius:MIN(self.frame.size.width, self.frame.size.height)/2 - 5  startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
    CGPathRef cgPath = CGPathCreateCopy(circlePath.CGPath);
    CGContextAddPath(context, cgPath);
    CGContextSetLineWidth(context, 1);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(cgPath);
}

@end
