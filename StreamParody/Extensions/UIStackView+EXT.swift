//
//  UIStackView+EXT.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 12/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
