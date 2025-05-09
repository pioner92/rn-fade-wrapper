import Foundation
import UIKit

@objcMembers
public class FadeViewFabric: FadeViewCore {

  override public init(frame: CGRect) {
    super.init(frame: frame)
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()

    let bigestSubview = superview?.subviews.max(
      by: { $0.frame.size.height < $1.frame.size.height
      })
    guard let bigestSubview else { return }

    DispatchQueue.main.async {
      super.initSubviewBounds(subview: bigestSubview)
    }
  }
}
