//
//  Shadowable.swift
//  UIMarket
//
//  Created by TabZhou on 14/09/2017.
//  Copyright © 2017 ZJT. All rights reserved.
//

import UIKit
protocol Shadowable {
    var shadowColor: UIColor? {get set}
    var shadowOpacity: Float {get set}
    var shadowRadius: CGFloat {get set}
    var shadowOffset: CGSize {get set}
}
