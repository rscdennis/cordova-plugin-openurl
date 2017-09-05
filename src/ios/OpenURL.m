#import "OpenURL.h"

@implementation OpenURL

- (void)open:(CDVInvokedUrlCommand *)command {
  NSString *url = [command.arguments objectAtIndex:0];

  if (url == nil || [url length] == 0) {
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No URL specified"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    return;
  }

  BOOL result = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
  if (!result) {
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to open URL"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    return;
  }

  CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:url];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
