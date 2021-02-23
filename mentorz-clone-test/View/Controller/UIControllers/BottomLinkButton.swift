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
        setTitleColor(UIColor.systemBlue, for: UIControl.State.normal)
        titleLabel?.textAlignment = .left
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel!.numberOfLines = 0
    }
}

class LoginSignupBottomLinkButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel!.font = UIFont.systemFont(ofSize: CGFloat(12))
        setTitleColor(UIColor.gray, for: UIControl.State.normal)
        titleLabel?.textAlignment = .center
        titleLabel!.numberOfLines = 0
    }
}
