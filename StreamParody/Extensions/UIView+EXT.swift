//
//  UIView+EXT.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 11/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func removeAllSubViews() {
        guard !self.subviews.isEmpty else { return }

        for view in self.subviews {
            view.removeFromSuperview()
        }
    }

    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
