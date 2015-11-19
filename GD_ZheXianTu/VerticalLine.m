//
//  VerticalLine.m
//  GD_ZheXianTu
//
//  Created by xiaoyu on 15/11/19.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "VerticalLine.h"

@implementation VerticalLine


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
    //画三道直线
    [self drawLineFrom:CGPointMake(self.bounds.origin.x/2, 0)
                    to:CGPointMake(self.bounds.origin.x/2, self.bounds.size.height)];
}
//直线
-(void)drawLineFrom:(CGPoint)startPoint
                 to:(CGPoint)endPoint
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x,endPoint.y);
    CGContextSetLineWidth(context,
                          2.0);
    CGContextStrokePath(context);
}
@end
