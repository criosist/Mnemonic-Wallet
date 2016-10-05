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
       return constraintsForPinToSuperViewWithPadding(view: view, upPadding: 0, downPadding: 0, leftPadding: 0, rightPadding: 0)
    }
    
    class func constraintsForPinToSuperViewWithPadding(view: UIView, upPadding: CGFloat, downPadding: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        let views = ["view": view]
        
        let horizontalConstraintsVisualFormat = "H:|-\(leftPadding)-[view]-\(rightPadding)-|"
        let verticalConstraintsVisualFormat = "V:|-\(upPadding)-[view]-\(downPadding)-|"
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        
        constraints.append(contentsOf: horizontalConstraints)
        constraints.append(contentsOf: verticalConstraints)
        
        return constraints
    }

}
