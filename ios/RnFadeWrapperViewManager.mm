#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"
#import "RnFadeWrapper-Swift.h"


@interface RnFadeWrapperViewManager : RCTViewManager
@end

@implementation RnFadeWrapperViewManager

RCT_EXPORT_MODULE(RnFadeWrapperView)

RCT_CUSTOM_VIEW_PROPERTY(color, UIColor, FadeViewOldArch) {
  view.fadeColor = json ? [RCTConvert UIColor:json] : view.fadeColor;
}

RCT_CUSTOM_VIEW_PROPERTY(sizeTop, float, FadeViewOldArch) {
  view.fadeSizeTop = json ? [RCTConvert double:json] : view.fadeSizeTop;
}

RCT_CUSTOM_VIEW_PROPERTY(sizeRight, float, FadeViewOldArch) {
  view.fadeSizeRight = json ? [RCTConvert double:json] : view.fadeSizeRight;
}

RCT_CUSTOM_VIEW_PROPERTY(sizeBottom, float, FadeViewOldArch) {
  view.fadeSizeBottom = json ? [RCTConvert double:json] : view.fadeSizeBottom;
}

RCT_CUSTOM_VIEW_PROPERTY(sizeLeft, float, FadeViewOldArch) {
  view.fadeSizeLeft = json ? [RCTConvert double:json] : view.fadeSizeLeft;
}

- (UIView *)view
{

  UIView* view = [FadeViewOldArch new];

  view.userInteractionEnabled = NO;

  return view;
}

@end
