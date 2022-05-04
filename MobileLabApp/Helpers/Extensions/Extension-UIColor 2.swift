//
//  Extension-UIColor.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 23.03.2022.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
