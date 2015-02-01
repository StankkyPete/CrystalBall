//
//  CrystalBall.h
//  CrystalBall
//
//  Created by Peter Dorsaneo on 12/28/14.
//  Copyright (c) 2014 Peter Dorsaneo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CrystalBall : NSObject
//instance var for 
{
    NSArray *_predictions;
    
    NSArray *_textColors;
}

// creates a nonchangeable property
@property (strong, nonatomic, readonly) NSArray *predictions;

@property(strong,nonatomic, readonly) NSArray *textColors;


//method for choosing predictions
-(NSString*) randomPrediction;



-(UIColor *) randomColor;




@end
