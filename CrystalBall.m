//
//  CrystalBall.m
//  CrystalBall
//
//  Created by Peter Dorsaneo on 12/28/14.
//  Copyright (c) 2014 Peter Dorsaneo. All rights reserved.
//

#import "CrystalBall.h"
#import "ViewController.h"

@implementation CrystalBall
-(NSArray *) predictions {
    if (_predictions == nil) {
        
        _predictions = [[NSArray alloc]initWithObjects: @"Live and let live",
                        @"Don't cry over spilt milk",
                        @"Always look on the bright side of life",
                        @"Nobody's perfect",
                        @"Can't see the woods for the trees",
                        @"Better to have loved and lost then not loved at all",
                        @"The early bird catches the worm",
                        @"As slow as a wet week",
                        @"The road to success is always under construction",nil];

    }
    
    return _predictions;
}



-(NSString *) randomPrediction {
    int random = arc4random_uniform(self.predictions.count);
    
    return [self.predictions objectAtIndex:random];
}




-(NSArray *) textColors {
    if (_textColors == nil) {
    _textColors = [[NSArray alloc]initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor grayColor], [UIColor cyanColor], [UIColor magentaColor], [UIColor purpleColor], [UIColor orangeColor ], [UIColor yellowColor], nil];
    }
    return _textColors ;
    
}

-(NSObject *) randomColor {
    int random = arc4random_uniform(self.textColors.count);
    
    return [self.textColors objectAtIndex:random];
}



@end
