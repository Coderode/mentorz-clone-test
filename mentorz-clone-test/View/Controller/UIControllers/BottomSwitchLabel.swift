//
//  BottomSwitchLabel.swift
//  mentorz-clone-test
//
//  Created by craterzone on 21/02/21.
//

import UIKit

class BottomSwitchLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        font = UIFont.boldSystemFont(ofSize: CGFloat(20))
        textColor = UIColor.white
        textAlignment = .right
    }

}
