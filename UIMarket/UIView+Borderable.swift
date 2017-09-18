//
//  UIView+Borderable.swift
//  UIMarket
//
//  Created by TabZhou on 08/09/2017.
//  Copyright © 2017 ZJT. All rights reserved.
//

import UIKit

//'@IBDesignable' not work here
extension UIView : Borderable {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
        
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
