//
//  MnemonicsHelpers.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 28/09/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit

class MnemonicsHelpers {
    
    class func constraintsForPinToSuperView(view: UIView) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        let views = ["view": view]
    
        let horizontalConstraintsVisualFormat = "H:|[view]|"
        let verticalConstraintsVisualFormat = "V:|[view]|"
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        
        constraints.append(contentsOf: horizontalConstraints)
        constraints.append(contentsOf: verticalConstraints)
        
        return constraints
    }
    
}
