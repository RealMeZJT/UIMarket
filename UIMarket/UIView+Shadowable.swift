//
//  UIView+Shadowable.swift
//  UIMarket
//
//  Created by TabZhou on 14/09/2017.
//  Copyright © 2017 ZJT. All rights reserved.
//

import UIKit

extension UIView : Shadowable {
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            guard let shadowColor = self.layer.shadowColor else {return nil}
            return UIColor(cgColor: shadowColor)
        }
        
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }

    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        
        set {
            self.layer.shadowOffset = newValue
        }
    }

}
