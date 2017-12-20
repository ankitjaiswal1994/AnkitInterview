//
//  UIViewController+Nib.swift
//  Intonate
//
//  Created by Aashish Dhawan on 6/28/17.
//  Copyright © 2017 Oratio LLC. All rights reserved.
//

import Foundation

extension UIViewController {
    class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
}
