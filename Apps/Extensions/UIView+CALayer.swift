//
//  UIView+CALayer.swift
//  Summoner
//
//  Created by Kang Byeonghak on 2022/08/17.
//

import UIKit

extension UIView {
  @IBInspectable var borderWidth: CGFloat {
    get { return layer.borderWidth }
    set { layer.borderWidth = newValue }
  }

  @IBInspectable var borderColor: UIColor? {
    get {
      guard let color = layer.borderColor else { return nil }
      return UIColor(cgColor: color)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }

  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }

  @IBInspectable var isCircular: Bool {
    get {
      let radius = self.frame.width/2
      return layer.cornerRadius == radius
    }
    set {
      if newValue {
        let radius = self.frame.width/2
        layer.cornerRadius = radius
      } else {
        layer.cornerRadius = 0
      }

      layer.masksToBounds = newValue
    }
  }
}

extension UIView {
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
