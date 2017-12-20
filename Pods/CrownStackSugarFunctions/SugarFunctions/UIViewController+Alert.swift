//
//  UIViewController+Alert.swift
//  Intonate
//
//  Created by Aashish Dhawan on 7/8/17.
//  Copyright © 2017 Oratio LLC. All rights reserved.
//

import Foundation


public extension UIViewController {
    
    struct AlertMessages {
        static let noInternetConnection = "No Internet connection avilable. Please connect to internet and try again."
    }
    
    func alert(message: String, title: String = "", OKAction: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: OKAction)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func alertNoInternetConnection() {
        alert(message: AlertMessages.noInternetConnection)
    }
}
