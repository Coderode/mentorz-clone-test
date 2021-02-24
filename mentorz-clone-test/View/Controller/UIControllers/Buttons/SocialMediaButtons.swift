//
//  SocialMediaButtons.swift
//  mentorz-clone-test
//
//  Created by craterzone on 21/02/21.
//

import Foundation
import UIKit

class SocialMediaButtons : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        setTitleColor(UIColor.white, for: UIControl.State.normal)
        titleLabel!.font = UIFont.systemFont(ofSize: CGFloat(18))
        tintColor = .white
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
        contentEdgeInsets = UIEdgeInsets(top: 0,left: 2,bottom: 0,right: 5)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}
