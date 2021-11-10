#import <React/RCTUtils.h>
#import <React/RCTBridgeModule.h>

@import SafariServices;

@interface RNSafariModalController : NSObject <RCTBridgeModule, SFSafariViewControllerDelegate>
@end

@implementation RNSafariModalController

+(BOOL)requiresMainQueueSetup {
  return YES;
}

-(dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(isAvailable) {
  if (@available(iOS 9.0, *)) {
    return @YES
  } else {
    return @NO
  }
}

RCT_EXPORT_METHOD(openURL:(NSString *)urlString modalize:(BOOL)modal) {
  if (@available(iOS 9.0, *)) {
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    UIViewController *currentVC = RCTPresentedViewController();
    SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
    safariViewController.delegate = self;
    if (modal) {
      safariViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    }
    [currentVC presentViewController:safariViewController animated:YES completion:nil];
  }
}

RCT_EXPORT_METHOD(close) {
  UIViewController *currentVC = RCTPresentedViewController();
  [currentVC dismissViewControllerAnimated:YES completion:nil];
}

@end
