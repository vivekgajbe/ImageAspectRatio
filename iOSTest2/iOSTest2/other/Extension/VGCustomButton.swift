//
//  VGCustomButton.swift
//  iOSTest2
//
//  Created by vivek G on 22/03/20.
//  Copyright © 2020 vivek G. All rights reserved.
//

import UIKit

@IBDesignable
class VGCustomButton: UIButton {

    @IBInspectable
    public var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
