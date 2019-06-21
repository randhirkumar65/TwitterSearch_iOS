//
//  Extensions.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation
import  UIKit

extension UIButton {
    func setShadowButton(color: UIColor, offset: CGSize, opacity: Float) {
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    func setCornerRadiusButton(value: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = value
    }
    
    func setBorderButton(color: UIColor, size: CGFloat) {
        layer.borderWidth = size
        layer.borderColor = color.cgColor
    }
    
    func setDashedBorderButton(color: UIColor) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let yourViewBorder = CAShapeLayer()
            yourViewBorder.strokeColor = color.cgColor
            yourViewBorder.lineDashPattern = [2, 2]
            yourViewBorder.frame = self.bounds
            yourViewBorder.fillColor = nil
            yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
            self.layer.addSublayer(yourViewBorder)
        }
    }
}

extension UIView {
    func setShadow(color: UIColor, offset: CGSize, opacity: Float) {
        let shadowPath = UIBezierPath(rect: self.bounds)
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    func setCornerRadius(value: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = value
    }
    
    func setBorder(color: UIColor, size: CGFloat) {
        layer.borderWidth = size
        layer.borderColor = color.cgColor
    }
    
    func setDashedBorderView(color: UIColor) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let yourViewBorder = CAShapeLayer()
            yourViewBorder.strokeColor = color.cgColor
            yourViewBorder.lineDashPattern = [2, 2]
            yourViewBorder.frame = self.bounds
            yourViewBorder.fillColor = nil
            yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
            self.layer.addSublayer(yourViewBorder)
        }
    }
}

extension UIImageView {
    func setShadowImageView(color: UIColor, offset: CGSize, opacity: Float) {
        let shadowPath = UIBezierPath(rect: self.bounds)
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    func setCornerRadiusImageView(value: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = value
    }
    
    func setBorderImageView(color: UIColor, size: CGFloat) {
        layer.borderWidth = size
        layer.borderColor = color.cgColor
    }
    
    func setDashedBorderImageView(color: UIColor) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let yourViewBorder = CAShapeLayer()
            yourViewBorder.strokeColor = color.cgColor
            yourViewBorder.lineDashPattern = [2, 2]
            yourViewBorder.frame = self.bounds
            yourViewBorder.fillColor = nil
            yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
            self.layer.addSublayer(yourViewBorder)
        }
    }
}

extension UITextField {
    func setShadowTextField(color: UIColor, offset: CGSize, opacity: Float) {
        let shadowPath = UIBezierPath(rect: self.bounds)
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    func setCornerRadiusTextField(value: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = value
    }
    
    func setBorderTextField(color: UIColor, size: CGFloat) {
        layer.borderWidth = size
        layer.borderColor = color.cgColor
    }
    
    func setDashedBorderTextField(color: UIColor) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let yourViewBorder = CAShapeLayer()
            yourViewBorder.strokeColor = color.cgColor
            yourViewBorder.lineDashPattern = [2, 2]
            yourViewBorder.frame = self.bounds
            yourViewBorder.fillColor = nil
            yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
            self.layer.addSublayer(yourViewBorder)
        }
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func formatUsingAbbrevation () -> String {
        let numFormatter = NumberFormatter()
        
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
        // you can add more !
        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        return numFormatter.string(from: NSNumber (value:value))!
    }
}
