//
//  ViewController.m
//  GD_ZheXianTu
//
//  Created by xiaoyu on 15/11/19.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "ViewController.h"
#import "Line.h"
#import "VerticalLine.h"
#import "ZhexianTu.h"
@interface ViewController ()
{
    Line *li;
    VerticalLine *ver;
    UILabel *titleLabel;
    ZhexianTu *zhexian;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    zhexian = [[ZhexianTu alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 300)];
    [self.view addSubview:zhexian];
    

    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
//    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    CGPoint point = [touch locationInView:zhexian]; //返回触摸点在视图中的当前坐标

    int x = point.x;
    int y = point.y;
//    NSLog(@"touch (x, y) is (%d, %d)", x, y);
    if (y >=0 && y<= zhexian.frame.size.height) {
        li = [[Line alloc] init];
        li.frame = CGRectMake(0, y, zhexian.bounds.size.width, 2);
        [zhexian addSubview:li];
        ver = [[VerticalLine alloc] init];
        ver.frame = CGRectMake(x, 0, 2, zhexian.bounds.size.height);
    }
    
    [zhexian addSubview:ver];
    
    titleLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(x-100, y + 20, 100, 15)];
    if (x >= 150) {
        
        if (y >= self.view.bounds.size.height/2) {
            titleLabel.frame = CGRectMake(x-100, y - 30, 100, 15);
        }
        else{
            titleLabel.frame = CGRectMake(x-100, y + 20, 100, 15);
            
        }
    }else {
        if (y >= self.view.bounds.size.height/2) {
            titleLabel.frame = CGRectMake(x+10, y - 30, 100, 15);
        }
        else{
            titleLabel.frame = CGRectMake(x+10, y + 20, 100, 15);
            
        }
    }
    titleLabel.text = [NSString stringWithFormat:@"(%d,%d)",x,y];
    [zhexian addSubview:titleLabel];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
//    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    CGPoint point = [touch locationInView:zhexian]; //返回触摸点在视图中的当前坐标

    int x = point.x;
    int y = point.y;
    if (y >=0 && y<= zhexian.frame.size.height) {
        if (!li) {
            li = [[Line alloc] init];
            li.frame = CGRectMake(0, y, zhexian.bounds.size.width, 2);
            [zhexian addSubview:li];
            ver = [[VerticalLine alloc] init];
            ver.frame = CGRectMake(x, 0, 2, zhexian.bounds.size.height);
            [zhexian addSubview:ver];
        }else{
            li.frame = CGRectMake(0, y, zhexian.bounds.size.width, 2);
            ver.frame = CGRectMake(x, 0, 2, zhexian.bounds.size.height);

        }

    }
    titleLabel.text = [NSString stringWithFormat:@"(%d,%d)",x,y];
    
    if (x >= 150) {
        
        titleLabel.frame = y>=self.view.bounds.size.height/2?CGRectMake(x-100, y - 20, 100, 15):CGRectMake(x-100, y + 20, 100, 15);
        
    }else {

        titleLabel.frame = y>=self.view.bounds.size.height/2?CGRectMake(x+10, y - 20, 100, 15):CGRectMake(x+10, y + 20, 100, 15);
    }
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [li removeFromSuperview];
    li = nil;
    [ver removeFromSuperview];
    ver = nil;
    [titleLabel removeFromSuperview];
    titleLabel = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
