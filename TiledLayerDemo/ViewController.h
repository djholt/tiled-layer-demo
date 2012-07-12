//
//  ViewController.h
//  TiledLayerDemo
//
//  Created by DJ Holt on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TiledImageView;

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet TiledImageView *tiledImageView;

@end
