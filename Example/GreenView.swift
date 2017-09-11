//
//  GreenView.swift
//  UIMarket
//
//  Created by TabZhou on 11/09/2017.
//  Copyright © 2017 ZJT. All rights reserved.
//

import UIKit

class GreenView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        say()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        say()
    }
    
    func say() {
        print("GreenView init")
    }
    @IBAction func greenClick(_ sender: Any) {
        print("green click inside")
    }
    
}
