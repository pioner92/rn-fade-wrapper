#import "RnFadeWrapperView.h"

#import "react/renderer/components/RNRnFadeWrapperViewSpec/ComponentDescriptors.h"
#import "react/renderer/components/RNRnFadeWrapperViewSpec/EventEmitters.h"
#import "react/renderer/components/RNRnFadeWrapperViewSpec/Props.h"
#import "react/renderer/components/RNRnFadeWrapperViewSpec/RCTComponentViewHelpers.h"

#import <React/RCTConversions.h>
#import <react/renderer/graphics/Color.h>
#import "RCTFabricComponentsPlugins.h"
#import "RnFadeWrapper-Swift.h"

using namespace facebook::react;

@interface RnFadeWrapperView () <RCTRnFadeWrapperViewViewProtocol>

@end

@implementation RnFadeWrapperView {
  FadeViewFabric* _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider {
  return concreteComponentDescriptorProvider<
      RnFadeWrapperViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps =
        std::make_shared<const RnFadeWrapperViewProps>();
    _props = defaultProps;

    _view = [FadeViewFabric new];

    _view.userInteractionEnabled = NO;

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const&)props
           oldProps:(Props::Shared const&)oldProps {
  const auto& oldViewProps =
      *std::static_pointer_cast<RnFadeWrapperViewProps const>(_props);
  const auto& newViewProps =
      *std::static_pointer_cast<RnFadeWrapperViewProps const>(props);

  if (oldViewProps.color != newViewProps.color) {
    UIColor* uiColor = RCTUIColorFromSharedColor(newViewProps.color);

    _view.fadeColor = uiColor;
  }

  if (oldViewProps.sizeTop != newViewProps.sizeTop) {
    _view.fadeSizeTop = newViewProps.sizeTop;
  }
  if (oldViewProps.sizeRight != newViewProps.sizeRight) {
    _view.fadeSizeRight = newViewProps.sizeRight;
  }
  if (oldViewProps.sizeBottom != newViewProps.sizeBottom) {
    _view.fadeSizeBottom = newViewProps.sizeBottom;
  }
  if (oldViewProps.sizeLeft != newViewProps.sizeLeft) {
    _view.fadeSizeLeft = newViewProps.sizeLeft;
  }

  [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> RnFadeWrapperViewCls(void) {
  return RnFadeWrapperView.class;
}

- hexStringToColor:(NSString*)stringToConvert {
  NSString* noHashString =
      [stringToConvert stringByReplacingOccurrencesOfString:@"#"
                                                 withString:@""];
  NSScanner* stringScanner = [NSScanner scannerWithString:noHashString];

  unsigned hex;
  if (![stringScanner scanHexInt:&hex])
    return nil;
  int r = (hex >> 16) & 0xFF;
  int g = (hex >> 8) & 0xFF;
  int b = (hex)&0xFF;

  return [UIColor colorWithRed:r / 255.0f
                         green:g / 255.0f
                          blue:b / 255.0f
                         alpha:1.0f];
}

@end
