//
//  RoundButton.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 24/10/2020.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
 
    @IBInspectable var cornerRadious: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadious
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    
    
}
