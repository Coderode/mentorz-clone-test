//
//  BottomLinkButton.swift
//  mentorz-clone-test
//
//  Created by craterzone on 21/02/21.
//

import UIKit

class BottomLinkButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel!.font = UIFont.systemFont(ofSize: CGFloat(12))
        setTitleColor(UIColor.blue, for: UIControl.State.normal)
        contentHorizontalAlignment = .left
    }
}
