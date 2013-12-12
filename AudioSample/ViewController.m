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
    AVAudioPlayer *BGMplayer;
}
@property (nonatomic, retain) AVAudioPlayer *SEplayer;
@property (nonatomic, retain) AVAudioPlayer *BGMplayer;
- (IBAction)playSE:(id)sender;
- (IBAction)playBGM:(id)sender;
- (IBAction)pauseBGM:(id)sender;
- (IBAction)stopBGM:(id)sender;
@end

@implementation ViewController
@synthesize SEplayer;
@synthesize BGMplayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: @"sampleSE" ofType: @"mp3"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    self.SEplayer = newPlayer;
    
    [SEplayer prepareToPlay];
    
    NSString *bgmFilePath = [[NSBundle mainBundle] pathForResource: @"BGMsample" ofType: @"mp3"];
    NSURL *bgmFileURL = [[NSURL alloc] initFileURLWithPath: bgmFilePath];

    AVAudioPlayer *newBGMPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: bgmFileURL error: nil];
    self.BGMplayer = newBGMPlayer;
    
    [BGMplayer prepareToPlay];
    
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

//BGMを再生するボタン
- (IBAction)playBGM:(id)sender{
    [BGMplayer play];
}

//BGMを再開するボタン
- (IBAction)pauseBGM:(id)sender{
    [BGMplayer pause];
}

//BGMを一時停止するボタン
- (IBAction)stopBGM:(id)sender{
    [BGMplayer stop];
    BGMplayer.currentTime = 0;
    [BGMplayer prepareToPlay];
}

@end

