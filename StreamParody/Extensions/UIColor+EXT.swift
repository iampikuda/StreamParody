//
//  UIColor+EXT.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 11/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

extension UIColor {
    enum Stream {
        static var primary: UIColor { return UIColor(red: 0.0863, green: 0.1412, blue: 0.1765, alpha: 1.0) }
        static var greyer: UIColor { return UIColor.white.withAlphaComponent(0.7) }
        static var orangy: UIColor { return UIColor(red: 0.9529, green: 0.702, blue: 0.3961, alpha: 1.0) }
    }

    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
