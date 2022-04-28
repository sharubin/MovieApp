//
//  Extension-CGFloat.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 23.03.2022.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
