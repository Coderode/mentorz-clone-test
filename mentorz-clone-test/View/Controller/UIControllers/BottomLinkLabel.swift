//
//  BottomLinkLabel.swift
//  mentorz-clone-test
//
//  Created by craterzone on 21/02/21.
//

import UIKit

class BottomLinkLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        font = UIFont.systemFont(ofSize: CGFloat(12))
        textColor = UIColor.white
        textAlignment = .right
    }
}
