//
//  NSMutableAttributedString+Utils.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 12/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {

    @discardableResult
    func withAttributes(
        text: String,
        textColor: UIColor,
        font: UIFont,
        letterSpacing: CGFloat = 1.0,
        underlined: Bool = false
        ) -> NSMutableAttributedString {

        let normal = NSMutableAttributedString(string: text)

        var attributes: [NSAttributedString.Key: Any] =
            [NSAttributedString.Key.foregroundColor: textColor,
             NSAttributedString.Key.font: font,
             NSAttributedString.Key.kern: letterSpacing]

        if underlined {
            attributes[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue
        }

        normal.addAttributes(attributes, range: NSRange(location: 0, length: normal.length))

        return NSMutableAttributedString(string: text, attributes: attributes)
    }

    @discardableResult
    func appendStringWithAttributes(
        text: String,
        textColor: UIColor,
        font: UIFont,
        letterSpacing: CGFloat = 1.0,
        underlined: Bool = false
        ) -> NSMutableAttributedString {

        let attribStr = NSMutableAttributedString().withAttributes(
            text: text,
            textColor: textColor,
            font: font,
            letterSpacing: letterSpacing,
            underlined: underlined
        )

        append(attribStr)
        return self
    }
}
