
#import "RNSafariModalController.h"

@implementation RNSafariModalController


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@synthesize bridge = _bridge;


+(BOOL)requiresMainQueueSetup {
  return YES;
}


RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isAvailable:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
  if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")) {
    resolve([NSNumber numberWithBool:YES]);
    return;
  }
  resolve([NSNumber numberWithBool:NO]);
}

RCT_EXPORT_METHOD(openURL:(NSString *)urlString) {
  NSURL *url = [[NSURL alloc] initWithString:urlString];
  
  dispatch_async(dispatch_get_main_queue(), ^{
    
    UIViewController *rootViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    while(rootViewController.presentedViewController) {
      rootViewController = rootViewController.presentedViewController;
    }
    
    SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:safariViewController];
    
    [navigationController setNavigationBarHidden:YES animated:NO];
    safariViewController.delegate = self;
    
    [rootViewController presentViewController:navigationController animated:YES completion:nil];
  });
}

RCT_EXPORT_METHOD(close) {
  dispatch_async(dispatch_get_main_queue(), ^{
    UIViewController *rootViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootViewController dismissViewControllerAnimated:YES completion:nil];
  });
}

@end
