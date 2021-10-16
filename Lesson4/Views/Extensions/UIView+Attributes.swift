//
//  UIView+Attributes.swift
//  Profilia
//
//  Created by Evans Owamoyo on 23.07.2021.
//

import UIKit



//MARK: extension for ImageView which contains helper functions like making circleAvatars
extension UIImageView {
    func makeRounded() {
        makeRounded(withColor: .black)
    }
    
    func makeRounded(withColor color: UIColor) {
        self.layer.borderWidth = 2
        self.layer.masksToBounds = false
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

// MARK: extension for textfields
@IBDesignable class CustomTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15.0, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
    
    //MARK: borderWidth for UIViews that have borders
    @IBInspectable var mBorderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            layer.borderWidth
        }
    }
    
    // MARK: cornerRadius for textfield
    @IBInspectable var mCornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }
    
    // MARK: borderColor for UIViews that have borders
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
