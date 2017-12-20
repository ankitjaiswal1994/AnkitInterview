//
//  Notification+Extension.swift
//  Intonate
//
//  Created by Amit Kumar Swami on 20/08/17.
//  Copyright © 2017 Oratio LLC. All rights reserved.
//

import Foundation
import UIKit

class Token {
    let center: NotificationCenter
    let token: NSObjectProtocol
    
    init(token: NSObjectProtocol, center: NotificationCenter) {
        self.token = token
        self.center = center
    }
    
    deinit {
        center.removeObserver(token)
    }
}

struct NotificationDescriptor<A> {
    let name: Notification.Name
    let convert: (Notification) -> A
}

extension NotificationCenter {
    func addObserver<A>(forDescriptor d: NotificationDescriptor<A>, using block: @escaping (A) -> ()) -> Token {
        let t = addObserver(forName: d.name, object: nil, queue: nil, using: { note in
            block(d.convert(note))
        })
        return Token(token: t, center: self)
    }
}

struct KeyboardPayload {
    let beginFrame: CGRect
    let endFrame: CGRect
    let curve: UIViewAnimationCurve?
    let duration: TimeInterval
}

extension KeyboardPayload {
    init(note: Notification) {
        guard let userInfo = note.userInfo else {
            self.beginFrame = CGRect.zero
            self.endFrame = CGRect.zero
            self.curve = nil
            self.duration = 0
            
            return
        }
        
        self.beginFrame = userInfo[UIKeyboardFrameBeginUserInfoKey] as! CGRect
        self.endFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
        self.curve = UIViewAnimationCurve(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int) ?? 0)
        self.duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
    }
}

let keyboardShowNotification = NotificationDescriptor<KeyboardPayload>(name: Notification.Name.UIKeyboardWillShow, convert: KeyboardPayload.init)
let keyboardHiderNotification = NotificationDescriptor<KeyboardPayload>(name: Notification.Name.UIKeyboardWillHide, convert: KeyboardPayload.init)
