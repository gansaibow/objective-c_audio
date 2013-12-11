//
//  ViewController.m
//  AudioSample
//
//  Created by IwamaTatsuya on 2013/12/11.
//  Copyright (c) 2013年 gansaibow. All rights reserved.
//

#import "ViewController.h"
//フレームワークのインポート文
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer *SEplayer;
}
@property (nonatomic, retain) AVAudioPlayer *SEplayer;
- (IBAction)playSE:(id)sender;
@end

@implementation ViewController
@synthesize SEplayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: @"sampleSE" ofType: @"mp3"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    self.SEplayer = newPlayer;
    
    [SEplayer prepareToPlay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//SEを再生するボタン
- (IBAction)playSE:(id)sender{
    [SEplayer play];
}

@end
