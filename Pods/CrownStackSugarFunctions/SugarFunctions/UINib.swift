//
//  UINib.swift
//  Intonate
//
//  Created by Infoedge on 7/23/17.
//  Copyright © 2017 Oratio LLC. All rights reserved.
//

import Foundation
import UIKit

extension UINib{
    
    static func instantiateWithOwner<T>(_ owner:AnyObject?) -> T {
        
        let mainBundle:Bundle = Bundle.main;
        let nibName = String(describing: T.self).components(separatedBy: ".").last
        let viewArray:Array = mainBundle.loadNibNamed(nibName!,
                                                      owner: owner, options: nil)!;
        return viewArray.first as! T;
    }
    
    convenience init(nibName name: String){
        self.init(nibName: name, bundle: nil)
    }
}

