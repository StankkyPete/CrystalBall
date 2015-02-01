//
//  ViewController.m
//  CrystalBall
//
//  Created by Peter Dorsaneo on 12/28/14.
//  Copyright (c) 2014 Peter Dorsaneo. All rights reserved.
//

/* */

#import "ViewController.h"
#import "CrystalBall.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController () <AVAudioPlayerDelegate>

@property (strong,nonatomic) AVAudioPlayer *backgroundMusicPlayer;

@end

@implementation ViewController /*  {
    SystemSoundID soundEffect;
} */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *backgroundMusicURL = [NSURL fileURLWithPath:backgroundMusicPath];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:nil];
    self.backgroundMusicPlayer.delegate = self ;
    self.backgroundMusicPlayer.numberOfLoops = 0;
    
    
    // alloc and init memory for crystalBall property
    self.crystalBall = [[CrystalBall alloc]init];
    
    
    // self.crystalBall.predictions = [[NSArray alloc]initWithObjects:@"1",@"2", nil];
    
    /*
     //hardcode background view hierarchy
    UIImage *background = [UIImage imageNamed:@"background"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:background];
    [self.view insertSubview:imageView atIndex:0];
     */
    
    //array of UIImage objects
    self.backgroundImage.animationImages = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"CB00001"],[UIImage imageNamed:@"CB00002"],[UIImage imageNamed:@"CB00003"],[UIImage imageNamed:@"CB00004"],[UIImage imageNamed:@"CB00005"],[UIImage imageNamed:@"CB00006"],[UIImage imageNamed:@"CB00007"],[UIImage imageNamed:@"CB00008"],[UIImage imageNamed:@"CB00009"],[UIImage imageNamed:@"CB00010"],[UIImage imageNamed:@"CB00011"],[UIImage imageNamed:@"CB00012"],[UIImage imageNamed:@"CB00013"],[UIImage imageNamed:@"CB00014"],[UIImage imageNamed:@"CB00015"],[UIImage imageNamed:@"CB00016"],[UIImage imageNamed:@"CB00017"],[UIImage imageNamed:@"CB00018"],[UIImage imageNamed:@"CB00019"],[UIImage imageNamed:@"CB00020"],[UIImage imageNamed:@"CB00021"],[UIImage imageNamed:@"CB00022"],[UIImage imageNamed:@"CB00023"],[UIImage imageNamed:@"CB00024"],[UIImage imageNamed:@"CB00025"],[UIImage imageNamed:@"CB00026"],[UIImage imageNamed:@"CB00027"],[UIImage imageNamed:@"CB00028"],[UIImage imageNamed:@"CB00029"],[UIImage imageNamed:@"CB00030"],[UIImage imageNamed:@"CB00031"],[UIImage imageNamed:@"CB00032"],[UIImage imageNamed:@"CB00033"],[UIImage imageNamed:@"CB00034"],[UIImage imageNamed:@"CB00035"],[UIImage imageNamed:@"CB00036"],[UIImage imageNamed:@"CB00037"],[UIImage imageNamed:@"CB00038"],[UIImage imageNamed:@"CB00039"],[UIImage imageNamed:@"CB00040"],[UIImage imageNamed:@"CB00041"],[UIImage imageNamed:@"CB00042"],[UIImage imageNamed:@"CB00043"],[UIImage imageNamed:@"CB00044"],[UIImage imageNamed:@"CB00045"],[UIImage imageNamed:@"CB00046"],[UIImage imageNamed:@"CB00047"],[UIImage imageNamed:@"CB00048"],[UIImage imageNamed:@"CB00049"],[UIImage imageNamed:@"CB00050"],[UIImage imageNamed:@"CB00051"],[UIImage imageNamed:@"CB00052"],[UIImage imageNamed:@"CB00053"],[UIImage imageNamed:@"CB00054"],[UIImage imageNamed:@"CB00055"],[UIImage imageNamed:@"CB00056"],[UIImage imageNamed:@"CB00057"],[UIImage imageNamed:@"CB00058"],[UIImage imageNamed:@"CB00059"],[UIImage imageNamed:@"CB00060"],nil];
    
    //sets time duration for animation
    self.backgroundImage.animationDuration = 2.5f;
    
    //sets animation loop to repeat once
    self.backgroundImage.animationRepeatCount = 1;
    
    //set label transparency to 0
    self.predictionLabel.alpha = 0.0;
    
    
    
}


/*
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGRect frame = self.predictionLabel.frame ;
    
     self.predictionLabel.frame = CGRectMake(23 , 23, 23, 23);

}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Pressed
- (IBAction)buttonPressed:(id)sender {
    NSLog(@"button pressed");
    
    
    /*
    //calls backgroundImage animation
    [self.backgroundImage startAnimating];
    
    // AudioServicesPlaySystemSound(soundEffect);

    
    //set predictionLabel to a random prediction  by using crystalBall class
    self.predictionLabel.text = [self.crystalBall randomPrediction];
    
    // self.predictionLabel.textColor = [UIColor redColor];
    
   // self.predictionLabel.frame = CGRectMake(40, 100, 90, 90);

    // sets animation of text transparency when button pressed
    [UIView animateWithDuration:6.0 animations:^{
        self.predictionLabel.alpha = 0.5;
    }];
     */
   
    [self makePrediction];
}



#pragma mark - Make Prediction
//method for making prediction
-(void) makePrediction {
    
        [self.backgroundMusicPlayer play];
    
        //calls backgroundImage animation
        [self.backgroundImage startAnimating];
    
    //set predictionLabel to a random prediction by calling crystalBall class
        self.predictionLabel.text = [self.crystalBall randomPrediction];
    
        self.predictionLabel.textColor = [self.crystalBall randomColor];
    
    
    // AudioServicesPlaySystemSound(soundEffect);
    
    // sets animation of text transparency when button pressed
    //[UIView animateWithDuration:6.0 animations:^{
      //  self.predictionLabel.alpha = 1.0;
    
   // }];
    
    [UIView animateWithDuration:1.0 delay: 0.0  options:UIViewAnimationOptionCurveEaseIn animations:^{ self.predictionLabel.alpha = 0;} completion:^(BOOL finished){
        [UIView animateWithDuration:1.0 delay:3.0 options:UIViewAnimationOptionCurveEaseOut animations:^{ self.predictionLabel.alpha = 1.0; } completion:nil];
        
    }];

}

#pragma mark - Motion Events
-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion began");
    //clears predictionLabel text when the shake gesture begins
    self.predictionLabel.text = nil;
    
    //sets text transparency to 0
    self.predictionLabel.alpha = 0.0;
}

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event   {
    NSLog(@"motion ended");
    // call makePrediction method when user shakes device
    if (motion == UIEventSubtypeMotionShake ) {
        [self makePrediction];
    }
}

-(void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion cancelled");
}

#pragma mark - Touch Events

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event   {
    //call make prediction in own class
    //[self makePrediction];
    
    //clears predictionLabel text when the shake gesture begins
    self.predictionLabel.text = nil;
    
    //sets text transparency to 0
    self.predictionLabel.alpha = 0.0;
    
    NSUInteger numberTaps = [[touches anyObject] tapCount];
    if (numberTaps == 2) {
        [self.predictionLabel removeFromSuperview];
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event    {
    //self.predictionLabel.text = [self.crystalBall randomPrediction];
    //self.predictionLabel.text = nil;
    
    //call makePrediction method when user lifts finger off touch event
   
    
     [self makePrediction];
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touches cancelled") ;
}
@end
