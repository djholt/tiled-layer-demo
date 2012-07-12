//
//  TiledImageView.m
//  TiledLayerDemo
//
//  Created by DJ Holt on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TiledImageView.h"

@implementation TiledImageView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        CATiledLayer *layer = (CATiledLayer *)self.layer;
        layer.levelsOfDetail = 4;
        layer.levelsOfDetailBias = 3;
        layer.tileSize = CGSizeMake(256, 256);
    }
    return self;
}

+ (Class)layerClass
{
    return [CATiledLayer class];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat scale = CGContextGetCTM(context).a;

    UIImage *tile = [self tileAtOffset:rect.origin scale:scale];
    [tile drawInRect:rect];

    [[UIColor whiteColor] set];
    CGContextSetLineWidth(context, 5.0 / scale);
    CGContextStrokeRect(context, rect);
}

- (UIImage *)tileAtOffset:(CGPoint)offset scale:(CGFloat)scale
{
    int x    = (int)(scale * offset.x);
    int y    = (int)(scale * offset.y);
    int size = (int)(scale * self.bounds.size.width);
    return [UIImage imageNamed:[NSString stringWithFormat:@"orion_%d_256x256+%d+%d.jpg", size, x, y]];
}

@end
