//
//  ViewController.m
//  DrawLed
//
//  Created by Dzung Tran on 9/21/15.
//  Copyright © 2015 Dzung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _margin;
    CGFloat _ballDiameter;
    CGFloat _screenWidth;
    CGFloat _screenHeight;
    int _numberOfBallsPerRow;
    int _tagNumber;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _margin = 40.0;
    _ballDiameter = 24.0;
    _screenWidth = self.view.bounds.size.width;
    _screenHeight = self.view.bounds.size.height;
    _numberOfBallsPerRow = 10;
    _tagNumber = 0;
    
    [self drawGridOfBalls];
}

- (void)drawGridOfBalls {
    CGFloat distance = (_screenWidth - _margin * 2) / (_numberOfBallsPerRow - 1);
    int numberOfRows = ((_screenHeight - _margin * 2) / distance) + 1;
    
    for (int i = 0; i < numberOfRows; i++) {
        [self drawRowOfBalls: _numberOfBallsPerRow distance: distance AtY: _margin + i * distance];
    }
}

- (void)drawRowOfBalls: (int) numberOfBalls
              distance: (CGFloat) distance
                   AtY: (CGFloat) y
{
    for (int i = 0; i < numberOfBalls; i++) {
        [self placeGreyBallAtX: _margin + i * distance andY: y];
    }
}

- (void)placeGreyBallAtX: (CGFloat)x
                    andY: (CGFloat)y
{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grey"]];
    ball.center = CGPointMake(x, y);
    ball.tag = _tagNumber++;
    [self.view addSubview:ball];
}

@end

