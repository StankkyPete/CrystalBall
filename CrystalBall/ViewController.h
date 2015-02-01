//
//  ViewController.h
//  CrystalBall
//
//  Created by Peter Dorsaneo on 12/28/14.
//  Copyright (c) 2014 Peter Dorsaneo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CrystalBall;

@interface ViewController : UIViewController

@property (strong,nonatomic) CrystalBall *crystalBall;

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;

- (IBAction)buttonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;



@end

