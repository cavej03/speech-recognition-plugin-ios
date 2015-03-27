//
//  SpeechRecognition.h
//  VoiceRecognition
//
//  Created by Rahul on 1/11/14.
//
//

#import <Cordova/CDV.h>
#import "SpeechToTextModule.h"


@interface SpeechRecognition : CDVPlugin
@property (nonatomic, strong) SpeechToTextModule *speech;
@property (nonatomic, copy) NSString* callbackId;

-(void)startRecording:(CDVInvokedUrlCommand*)command;
-(void)stopRecording:(CDVInvokedUrlCommand*)command;
-(void)showOutput:(CDVInvokedUrlCommand*)command;
@end
