//
//  ORDesinables.swift
//  Intonate
//
//  Created by Shubham on 7/23/17.
//  Copyright © 2017 Oratio LLC. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class ORDesignableButton: UIButton {
    
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable var shadowColor : UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset : CGSize = CGSize(width: 0, height: 0){
        didSet{
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    
    @IBInspectable var shadowOpacity : Float = 0{
        didSet{
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius : CGFloat = 0{
        didSet{
            self.layer.shadowRadius = self.shadowRadius
        }
    }
}

@IBDesignable
class ORDesignableView: UIView {
    
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable var shadowColor : UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset : CGSize = CGSize(width: 0, height: 0){
        didSet{
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    
    @IBInspectable var shadowOpacity : Float = 0{
        didSet{
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius : CGFloat = 0{
        didSet{
            self.layer.shadowRadius = self.shadowRadius
        }
    }
}

@IBDesignable
class ORDesignableTextField: UITextField {
    
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable var placeHolderColor: UIColor? {
        get
        {
            return self.placeHolderColor
        }
        
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
    
    
}

@IBDesignable
class ORDesignableLabel: UILabel {
    
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}

@IBDesignable
class ORDesignableImageView: UIImageView {
    
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}

