//
//  ViewController.m
//  滑动按钮
//
//  Created by Macbook Pro on 16/1/20.
//  Copyright © 2016年 Macbook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton *sliderButton;
@property (nonatomic,strong) UILabel *line;
@property (nonatomic,strong) NSArray *lArray;
@property (nonatomic) UIColor *lineColor;
@end

@implementation ViewController
@synthesize sliderButton;
@synthesize line;
@synthesize lArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)setslideBtnNoAnimationWithTitleArray:(NSArray *)array
                                     andRect:(CGRect)rect
                              andNormalColor:(UIColor *)color
                            andSelectedColor:(UIColor *)highcolor
                            andNormalBackImg:(NSString *)normal
                          andSelectedBackImg:(NSString *)selected
{
    for (int i = 0; i < array.count; i++) {
        sliderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sliderButton setTitle:array[i] forState:UIControlStateNormal];
        [sliderButton setTitleColor:color forState:UIControlStateNormal];
        [sliderButton setTitleColor:highcolor forState:UIControlStateSelected];
        [sliderButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",normal]] forState:UIControlStateNormal];
        [sliderButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",selected]] forState:UIControlStateSelected];
        sliderButton.titleLabel.font = [UIFont systemFontOfSize:16];
        sliderButton.frame = rect;
        sliderButton.tag = 1 + i;
        [sliderButton addTarget:self action:@selector(changeControllerClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sliderButton];
        if (i == 0) {
            sliderButton.selected = NO;
        }
    }
    line.backgroundColor = highcolor;
    [self.view addSubview:line];
}

- (void)changeControllerClick:(UIButton *)sender
{
    if (sender.tag != 1) {
        UIButton *btn = (UIButton *)[self.view viewWithTag:1];
        btn.selected = NO;
    }
    if (sender != self.sliderButton) {
        sliderButton.selected = NO;
        sliderButton = sender;
    }
    sliderButton.selected = NO;
    switch (sender.tag) {
        case 1:
            [line removeFromSuperview];
            [self setUptheLine:1];
            /**
             [此处写加载页面需要做的操作];
             */
            break;
            /**
             .
             .
             .
             .
             .
             .
             .
             .
         case lArray.count + 1:
             
             */
        
        default:
            break;
    }
}
- (void)setUptheLine:(NSInteger)index
{
    /**
     横排
     */
//    line = [[UILabel alloc]initWithFrame:CGRectMake(index * [UIScreen mainScreen].bounds.size.width / lArray.count , 103, [UIScreen mainScreen].bounds.size.width / lArray.count, 1)];
    /**
     竖排
     */
    line = [[UILabel alloc]initWithFrame:CGRectMake(0, 103+index*([UIScreen mainScreen].bounds.size.height - 103)/lArray.count, [UIScreen mainScreen].bounds.size.width / lArray.count, 1)];
    
    line.backgroundColor = self.lineColor;
    [self.view addSubview:self.line];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
