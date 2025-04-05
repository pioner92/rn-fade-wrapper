
import Foundation
import UIKit

@objcMembers
public class FadeViewOldArch: FadeViewCore {

  override public init(frame: CGRect) {
    super.init(frame: frame)
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()

    guard let bigestSubview = self.subviews.first else { return }

    super.initSubviewBounds(subview: bigestSubview)
  }
}
