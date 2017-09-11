//
//  AuthCodeInput.swift
//  UIMarket
//
//  Created by TabZhou on 08/09/2017.
//  Copyright © 2017 ZJT. All rights reserved.
//

import UIKit

protocol AuthCodeInputDelegatet {
    func numberOfColumnAuthCodeInput(_ authCodeInput: AuthCodeInput) -> Int
    func authCodeInput(_ authCodeInput: AuthCodeInput, boxForColumnAt column: Int, input:String?) -> UIView
}

open class AuthCodeInput: UIView, UIKeyInput, AuthCodeInputDelegatet {
    var delegate: AuthCodeInputDelegatet?
    
    typealias Box = UILabel
    private(set) var text = ""
    private let defaultMaxCount: Int = 4
    private var boxs: [UIView] = []
    private var baseLines:[UIView] = []
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    

    private func setup() {
        removeBoxs()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(becomeFirstResponder))
        self.addGestureRecognizer(tapGesture)
        
        if delegate == nil {
            delegate = self
        }
        
        reloadData()
    }
    
    func reloadData() {
        let column = delegate?.numberOfColumnAuthCodeInput(self) ?? 0
        for index in 0..<column {
            updateBox(at: index)
        }
    }
    
    private func removeBoxs() {
        for box in boxs {
            box.removeFromSuperview()
        }
        
        boxs = []
    }
    
    //
    func numberOfColumnAuthCodeInput(_ authCodeInput: AuthCodeInput) -> Int {
        return defaultMaxCount
    }
    
    func authCodeInput(_ authCodeInput: AuthCodeInput, boxForColumnAt column: Int, input: String?) -> UIView {
        let label = UILabel()
        //label.text = input ?? ""
        label.text = "\(column)"
        label.textColor = UIColor.black
        return label
    }
    
    private func updateBox(at column: Int) {
        
        let view = delegate?.authCodeInput(self,
                                           boxForColumnAt: column,
                                           input: text)
        if let view = view {
            updateBox(view, at: column)
        }
    }
    
    private func updateBox(_ box: UIView, at column: Int) {
        let boxCount = delegate?.numberOfColumnAuthCodeInput(self) ?? 0
        
        if !self.subviews.contains(box) {
            self.addSubview(box)
        }
        
        let preBox: UIView? = (column - 1 > 0) ? boxs[column - 1] : nil
        let nextBox: UIView? = (column + 1 < boxs.count) ? boxs[column + 1] : nil
        
        let margins = box.layoutMarginsGuide
        box.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: CGFloat(1 / boxCount)).isActive = true
        
        if let preBox = preBox {
            preBox.trailingAnchor.constraint(equalTo: box.leadingAnchor).isActive = true
        } else {
            self.leadingAnchor.constraint(equalTo: box.leadingAnchor).isActive = true
        }
        
        if let nextBox = nextBox {
            nextBox.leadingAnchor.constraint(equalTo: box.trailingAnchor).isActive = true
        } else {
            self.trailingAnchor.constraint(equalTo: box.trailingAnchor).isActive = true
        }
        
    }
    
    public var hasText: Bool {
        return true
    }
    
    public func insertText(_ text: String) {
        self.text += text
        let column = self.text.characters.count
        updateBox(at: column)
    }

    
    public func deleteBackward() {
        self.text.remove(at: self.text.endIndex)
        let column = self.text.characters.count
        updateBox(at: column)
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
