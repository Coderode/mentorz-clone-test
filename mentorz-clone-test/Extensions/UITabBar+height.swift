//
//  UITabBar+height.swift
//  mentorz-clone-test
//
//  Created by craterzone on 01/03/21.
//

import Foundation
import UIKit
extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 100
        return sizeThatFits
    }
}
