//
//  SpeechRecognition.m
//  VoiceRecognition
//
//  Created by Rahul on 1/11/14.
//
//

#import "SpeechRecognition.h"
#import <Cordova/CDV.h>

static NSString *output;
@implementation SpeechRecognition

-(void)startRecording:(CDVInvokedUrlCommand *)command
{
    self.speech = [[SpeechToTextModule alloc] initWithNoGUIAndLocale:kLANG_ENGLISH];
    [self.speech setDelegate:self];
    [self.speech beginRecording];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)stopRecording:(CDVInvokedUrlCommand *)command
{
    [self.speech stopRecording:YES];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)didRecognizeResponse:(NSString *)recognizedText
{

    output = recognizedText;
    NSLog(@"Recognized Text = %@ and Output = %@",recognizedText,output);
    
}

-(void)speechStartRecording
{
    NSLog(@"REC...");
}

-(void)showOutput:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    // NSString* jString;
    NSLog(@"Output = %@",output);
    if (output != NULL) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:output];
        //jString = [pluginResult toSuccessCallbackString:callbackId];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error Description"];
        //jString = [pluginResult toErrorCallbackString:callbackId];
    }
    output = NULL;
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    //[self writeJavascript:jString];
}

-(void)speechStopRecording
{
    NSLog(@"STOP");
}

@end
