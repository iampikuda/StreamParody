//
//  UIViewController+EXT.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 11/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showPendingImplementationAlert() {
        let alert = UIAlertController(title: "Pending Implementation", message: "Coming soon", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
}
