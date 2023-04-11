//
//  UIImage+.swift
//  Figma
//
//  Created by Kirill Dev on 24.03.2023.
//

import UIKit

// MARK: - Add special border UIImage
extension UIImage {
  func imageByAddingBorder(width: CGFloat, color: UIColor) -> UIImage? {
    UIGraphicsBeginImageContext(self.size)
    let imageRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
    self.draw(in: imageRect)
    
    let context = UIGraphicsGetCurrentContext()
    let borderRect = imageRect.insetBy(dx: width / 2, dy: width / 2)
    
    context?.setStrokeColor(color.cgColor)
    context?.setLineWidth(width)
    context?.stroke(borderRect)
    
    let borderedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return borderedImage
  }
}

// MARK: - Change corners UIImage
extension UIImage {
  public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
    let maxRadius = min(size.width, size.height) / 2
    let cornerRadius: CGFloat
    
    if let radius = radius, radius > 0 && radius <= maxRadius {
      cornerRadius = radius
    } else {
      cornerRadius = maxRadius
    }

    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    
    let rect = CGRect(origin: .zero, size: size)
    UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
    draw(in: rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
}

// MARK: - Set Rouded
extension UIImageView {
   func setRounded() {
      let radius = CGRectGetWidth(self.frame) / 3
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}

// MARK: - Change Size
extension UIImage {
  func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
    let widthRatio = targetSize.width / size.width
    let heightRatio = targetSize.height / size.height
    
    let scaleFactor = min(widthRatio, heightRatio)
    
    let scaledImageSize = CGSize(
      width: size.width * scaleFactor,
      height: size.height * scaleFactor
    )
    
    let renderer = UIGraphicsImageRenderer(
      size: scaledImageSize
    )
    
    let scaledImage = renderer.image { _ in
      self.draw(in: CGRect(
        origin: .zero,
        size: scaledImageSize
      ))
    }
    
    return scaledImage
  }
}
