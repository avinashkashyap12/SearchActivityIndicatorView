//
//  ViewController.h
//  SearchActivityIndicatorViewSample
//
//  Created by Avinash Kashyap on 10/9/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchActivityIndicatorView.h"
@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet SearchActivityIndicatorView *seachActivityIndicatorView;
-(IBAction)handleTapGesture:(UITapGestureRecognizer *)sender;
@end

