//
//  BorderButton.swift
//  UIMarket
//
//  Created by TabZhou on 08/09/2017.
//  Copyright © 2017 ZJT. All rights reserved.
//

import UIKit

@IBDesignable
class BorderButton: UIButton, Colorable {
    
    private var _cornerRadius: CGFloat = 0
    override var cornerRadius: CGFloat {
        get {
            return _cornerRadius
        }
        
        set {
            _cornerRadius = newValue
            configUI()
        }
    }
    
    private var _borderWidth: CGFloat = 0
    override var borderWidth: CGFloat {
        get {
            return _borderWidth
        }
        
        set {
            _borderWidth = newValue
            configUI()
        }
    }
    
    private var _borderColor: UIColor?
    override var borderColor: UIColor? {
        get {
            return _borderColor
        }
        
        set {
            _borderColor = newValue
            configUI()
        }
    }
    
    @IBInspectable
    var normalBgColor: UIColor? {
        didSet {
            configUI()
        }
    }
    
    @IBInspectable
    var disableBgColor: UIColor? {
        didSet {
            configUI()
        }
    }
    var disableBorderColor: UIColor? {
        didSet {
            configUI()
        }
    }
    
    
    var disableTextColor: UIColor? //unuse
    
    override var isEnabled: Bool {
        didSet {
            configUI()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configUI()
    }
    
    private func configUI() {
        var cBgColor: UIColor?
        var cBorderColor: UIColor?
        let cBorderWidth: CGFloat = self.borderWidth
        let cCornerRadius: CGFloat = self.cornerRadius
        
        if isEnabled {
            cBgColor = self.normalBgColor
            cBorderColor = self.borderColor
        } else {
            cBgColor = self.disableBgColor
            cBorderColor = self.disableBorderColor
        }
        
        self.backgroundColor = cBgColor
        self.layer.borderColor = cBorderColor?.cgColor
        self.layer.borderWidth = cBorderWidth
        self.layer.cornerRadius = cCornerRadius
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
