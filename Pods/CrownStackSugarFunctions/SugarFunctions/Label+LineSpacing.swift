
//
//  Label+LineSpacing.swift
//  Intonate
//
//  Created by Crownstack on 25/09/17.
//  Copyright © 2017 Oratio LLC. All rights reserved.
//

import Foundation

extension UILabel {
    func setLineSpacing(lineSpace: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        paragraphStyle.alignment = self.textAlignment
        let attrString = NSMutableAttributedString(string: self.text!)
        attrString.addAttribute(NSFontAttributeName, value: self.font, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }
}
