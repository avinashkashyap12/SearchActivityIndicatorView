//
//  ViewController.m
//  SearchActivityIndicatorViewSample
//
//  Created by Avinash Kashyap on 10/9/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
-(IBAction)handleTapGesture:(UITapGestureRecognizer *)sender{
    
    if (self.seachActivityIndicatorView.isAnimating == YES) {
        [self.seachActivityIndicatorView stopSearching];
    }
    else{
        [self.seachActivityIndicatorView startSearching];
    }
}
@end
