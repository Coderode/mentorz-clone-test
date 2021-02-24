//
//  BackButton.swift
//  mentorz-clone-test
//
//  Created by craterzone on 23/02/21.
//

import Foundation
import UIKit
class BackButton : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        tintColor = #colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1)
        setImage(UIImage(named: "w_arrow"), for: .normal)
    }
}
