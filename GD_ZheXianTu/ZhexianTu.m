//
//  ZhexianTu.m
//  GD_ZheXianTu
//
//  Created by xiaoyu on 15/11/19.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "ZhexianTu.h"
#define GraphColor      [[UIColor greenColor] colorWithAlphaComponent:0.5]
#define point(x, y)                                 CGPointMake((x) * kXScale, 15 + (y) * kYScale)

@implementation ZhexianTu


const CGFloat   kXScale = 15.0;
const CGFloat   kYScale = 50.0;

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
    NSArray *lines = @[[NSValue valueWithCGPoint:CGPointMake(0, self.bounds.size.height/2)],
                       [NSValue valueWithCGPoint:CGPointMake(100/2, 10/2)],
                       [NSValue valueWithCGPoint:CGPointMake(280/2, 410/2)],
                       [NSValue valueWithCGPoint:CGPointMake(330/2, 350/2)],
                       [NSValue valueWithCGPoint:CGPointMake(400/2,  self.bounds.size.height)],
                       [NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width,self.bounds.size.height/2)]];
    [self drawLines:lines];

}


-(void)drawLines:(NSArray *)pointArray
{
    NSAssert(pointArray.count>=2,@"数组长度必须大于等于2");
    NSAssert([[pointArray[0] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    NSValue *startPointValue = pointArray[0];
    CGPoint  startPoint      = [startPointValue CGPointValue];
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    [self drawAtPoint:point(0,startPoint.y/2) withStr:@"0"];
    [self drawPointWithPoint:startPoint];

    for(int i = 1;i<pointArray.count;i++)
    {
        NSAssert([[pointArray[i] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
        NSValue *pointValue = pointArray[i];
        CGPoint  point      = [pointValue CGPointValue];
        CGContextAddLineToPoint(context, point.x,point.y);
        [self drawAtPoint:point(point.x,point.y) withStr:[NSString stringWithFormat:@"%.f",point.x]];
        [self drawPointWithPoint:point];

    }
    
    CGContextStrokePath(context);
}
- (void)drawPointWithPoint:(CGPoint)point {
//    NSLog(@"point - %f,%f",point.x,point.y);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(point.x-2.5, point.y-2.5, 5, 5)];
    label.layer.cornerRadius = 2.5;
    label.clipsToBounds = YES;
    label.backgroundColor = [UIColor blackColor];
    [self addSubview:label];
    
}
- (void)drawAtPoint:(CGPoint)point withStr:(NSString *)str
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
        [str drawAtPoint:point withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8], NSStrokeColorAttributeName:GraphColor}];
#endif
  
    
}
@end
