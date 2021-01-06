#import <React/RCTUtils.h>

#import "RNSafariModalController.h"

@implementation RNSafariModalController

+(BOOL)requiresMainQueueSetup {
  return YES;
}

-(dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isAvailable:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
  if (@available(iOS 9.0, *)) {
    resolve([NSNumber numberWithBool:YES]);
  } else {
    resolve([NSNumber numberWithBool:NO]);
  }
}

RCT_EXPORT_METHOD(openURL:(id)urlString) {
  if (@available(iOS 9.0, *)) {
    NSURL *url = [[NSURL alloc] initWithString:urlString];

    UIViewController *rootViewController = RCTPresentedViewController();

    SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
    safariViewController.delegate = self;

    [rootViewController presentViewController:safariViewController animated:YES completion:nil];
  }
}

RCT_EXPORT_METHOD(close) {
  UIViewController *rootViewController = RCTPresentedViewController();
  [rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
