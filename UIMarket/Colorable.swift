//
//  StateColorable.swift
//  UIMarket
//
//  Created by TabZhou on 08/09/2017.
//  Copyright © 2017 ZJT. All rights reserved.
//

import UIKit


protocol Colorable {
    var normalBgColor: UIColor? {get set}
    var disableBgColor: UIColor? {get set}
    var disableBorderColor: UIColor? {get set}
    var disableTextColor: UIColor? {get set}
}
