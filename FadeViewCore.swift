
import Foundation
import UIKit

@objcMembers
public class FadeViewCore: UIView {
  var containerBounds: CGRect?

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
      DispatchQueue.main.async {
        self.updateSizeRight(size: self.fadeSizeRight)
      }
    }
  }

  public var fadeSizeLeft = 0.0 {
    didSet {
      updateSizeLeft(size: fadeSizeLeft)
    }
  }

  private func updateSizeTop(size: CGFloat) {
    if(size == 0){
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
  }

  private func updateSizeBottom(size: CGFloat) {

    if(size == 0){
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
  }

  private func updateSizeRight(size: CGFloat) {
    if(size == 0){
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
  }

  private func updateSizeLeft(size: CGFloat) {
    if(size == 0){
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
  }

  var gradientColors: [CGColor] = [
    UIColor.red.cgColor,
    UIColor.red.withAlphaComponent(0).cgColor,
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


  func initSubviewBounds(subview: UIView){
    containerBounds = subview.bounds

    self.updateSizeTop(size: self.fadeSizeTop)
    self.updateSizeRight(size: self.fadeSizeRight)
    self.updateSizeBottom(size: self.fadeSizeBottom)
    self.updateSizeLeft(size: self.fadeSizeLeft)

    subview.layer.addSublayer(gradientLayerTop)
    subview.layer.addSublayer(gradientLayerBottom)
    subview.layer.addSublayer(gradientLayerLeft)
    subview.layer.addSublayer(gradientLayerRight)
  }
}
