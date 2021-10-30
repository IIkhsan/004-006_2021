//
//  CustomTextField.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 30.10.2021.
//

import UIKit

@IBDesignable class CustomTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15.0, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
    
    //MARK: UIView borderWidth
    @IBInspectable var mBorderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            layer.borderWidth
        }
    }
    
    // MARK: TextField cornerRadius
    @IBInspectable var mCornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }
    
    // MARK: UIView borderColor
    @IBInspectable var mBorderColor: UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let borderColor = layer.borderColor {
                return UIColor(cgColor: borderColor)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var mPlaceHolderColor: UIColor? {
        get {
            return self.mPlaceHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "",
                                                            attributes:[NSAttributedString.Key.foregroundColor : newValue!])
        }
    }
    
    // shakes the textfield 4 times with a (10px) dx
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 10, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 10, y: center.y))
        layer.add(animation, forKey: "position")
    }
}
