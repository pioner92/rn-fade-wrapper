
import Foundation
import UIKit

@objcMembers
public class FadeViewCore: UIView {
  private var containerBounds: CGRect?

  private let shapeLayer = CAShapeLayer()

  private var savedSubview: UIView?

  public var fadeColor: UIColor = .white {
    didSet {
      let colors = [
        fadeColor.cgColor,
        fadeColor.withAlphaComponent(0).cgColor,
      ]
      gradientLayerTop.colors = colors
      gradientLayerBottom.colors = colors
      gradientLayerRight.colors = colors
      gradientLayerLeft.colors = colors
    }
  }

  public var fadeSizeTop = 0.0 {
    didSet {
      updateSizeTop(size: fadeSizeTop)
    }
  }

  public var fadeSizeBottom = 0.0 {
    didSet {
      updateSizeBottom(size: fadeSizeBottom)
    }
  }

  public var fadeSizeRight = 0.0 {
    didSet {
      updateSizeRight(size: fadeSizeRight)
    }
  }

  public var fadeSizeLeft = 0.0 {
    didSet {
      updateSizeLeft(size: fadeSizeLeft)
    }
  }

  private func updateSizeTop(size: CGFloat) {
    if size == 0 {
      gradientLayerTop.isHidden = true
      return
    }
    gradientLayerTop.isHidden = false
    gradientLayerTop.frame = CGRect(
      x: 0,
      y: -size,
      width: containerBounds?.width ?? 0,
      height: size
    )

    let isReversed = size < 0

    let start = CGPoint(x: 0.5, y: 1)
    let end = CGPoint(x: 0.5, y: 0)

    gradientLayerTop.startPoint = isReversed ? end : start
    gradientLayerTop.endPoint = isReversed ? start : end
  }

  private func updateSizeBottom(size: CGFloat) {
    if size == 0 {
      gradientLayerBottom.isHidden = true
      return
    }
    gradientLayerBottom.isHidden = false

    gradientLayerBottom.frame = CGRect(
      x: 0,
      y: containerBounds?.maxY ?? 0,
      width: containerBounds?.width ?? 0,
      height: size
    )

    let isReversed = size < 0

    let start = CGPoint(x: 0.5, y: 0)
    let end = CGPoint(x: 0.5, y: 1)

    gradientLayerBottom.startPoint = isReversed ? end : start
    gradientLayerBottom.endPoint = isReversed ? start : end
  }

  private func updateSizeRight(size: CGFloat) {
    if size == 0 {
      gradientLayerRight.isHidden = true
      return
    }
    gradientLayerRight.isHidden = false
    gradientLayerRight.frame = CGRect(
      x: containerBounds?.maxX ?? 0,
      y: 0,
      width: size,
      height: containerBounds?.height ?? 0
    )

    let isReversed = size < 0

    let start = CGPoint(x: 0, y: 0.5)
    let end = CGPoint(x: 1, y: 0.5)

    gradientLayerRight.startPoint = isReversed ? end : start
    gradientLayerRight.endPoint = isReversed ? start : end
  }

  private func updateSizeLeft(size: CGFloat) {
    if size == 0 {
      gradientLayerLeft.isHidden = true
      return
    }
    gradientLayerLeft.isHidden = false
    gradientLayerLeft.frame = CGRect(
      x: -size,
      y: 0,
      width: size,
      height: containerBounds?.height ?? 0
    )

    let isReversed = size < 0

    let start = CGPoint(x: 1, y: 0.5)
    let end = CGPoint(x: 0, y: 0.5)

    gradientLayerLeft.startPoint = isReversed ? end : start
    gradientLayerLeft.endPoint = isReversed ? start : end
  }

  var gradientColors: [CGColor] = [
    UIColor.white.cgColor,
    UIColor.white.withAlphaComponent(0).cgColor,
  ]

  let gradientLayerTop: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.startPoint = CGPoint(x: 0.5, y: 1)
    layer.endPoint = CGPoint(x: 0.5, y: 0)
    layer.locations = [0, 1]
    return layer
  }()

  let gradientLayerBottom: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.startPoint = CGPoint(x: 0.5, y: 0)
    layer.endPoint = CGPoint(x: 0.5, y: 1)
    layer.locations = [0, 1]
    return layer
  }()

  let gradientLayerRight: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.startPoint = CGPoint(x: 0, y: 0.5)
    layer.endPoint = CGPoint(x: 1, y: 0.5)
    layer.locations = [0, 1]
    return layer
  }()

  let gradientLayerLeft: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.startPoint = CGPoint(x: 1, y: 0.5)
    layer.endPoint = CGPoint(x: 0, y: 0.5)
    layer.locations = [0, 1]
    return layer
  }()

  override public init(frame: CGRect) {
    super.init(frame: frame)
    gradientLayerTop.colors = gradientColors
    gradientLayerBottom.colors = gradientColors
    gradientLayerLeft.colors = gradientColors
    gradientLayerRight.colors = gradientColors
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  func initShapeLayer() {
    guard let savedSubview else { return }

    let fillPath = UIBezierPath(rect: savedSubview.bounds)

    let outPath = UIBezierPath(roundedRect: savedSubview.bounds, cornerRadius: savedSubview.layer.cornerRadius)

    fillPath.append(outPath)
    fillPath.usesEvenOddFillRule = true

    shapeLayer.path = fillPath.cgPath
    shapeLayer.fillRule = .evenOdd
    shapeLayer.fillColor = fadeColor.cgColor

    savedSubview.layer.addSublayer(shapeLayer)
  }

  func initSubviewBounds(subview: UIView) {
    containerBounds = subview.bounds
    savedSubview = subview

    self.updateSizeTop(size: self.fadeSizeTop)
    self.updateSizeRight(size: self.fadeSizeRight)
    self.updateSizeBottom(size: self.fadeSizeBottom)
    self.updateSizeLeft(size: self.fadeSizeLeft)

    if subview.layer.cornerRadius > 0 {
      initShapeLayer()
    }

    subview.layer.addSublayer(gradientLayerTop)
    subview.layer.addSublayer(gradientLayerBottom)
    subview.layer.addSublayer(gradientLayerLeft)
    subview.layer.addSublayer(gradientLayerRight)
  }
}
