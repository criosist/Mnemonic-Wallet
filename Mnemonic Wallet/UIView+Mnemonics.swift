//
//  UIView+Mnemonics.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 05/10/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func applyCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = (radius != 0)
    }
}
