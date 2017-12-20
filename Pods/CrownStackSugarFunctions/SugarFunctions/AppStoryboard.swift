//
//  AppStoryboard.swift
//  EquipmentDepot
//
//  Created by Ankit Jaiswal on 20/09/17.
//  Copyright © 2017 Equipement Depo. All rights reserved.
//
import UIKit

enum AppStoryboard: String {
    case TabBarController
    case LoginSignUp
    case Catalog
    case Invoice
    case Branches
}

extension AppStoryboard {
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID: String {
        let vcName = "\(self)"
        return vcName
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
