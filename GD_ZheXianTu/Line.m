//
//  Line.m
//  ;
//
//  Created by xiaoyu on 15/11/19.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "Line.h"

@implementation Line
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{

    [self drawLineFrom:CGPointMake(0, self.bounds.size.height/2)
                    to:CGPointMake(self.bounds.size.width, self.bounds.size.height/2)];
}

//直线
-(void)drawLineFrom:(CGPoint)startPoint
                 to:(CGPoint)endPoint
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x,endPoint.y);
    CGContextSetLineWidth(context,
                          1.0);
    CGContextStrokePath(context);
}

@end
