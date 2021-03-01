//
//  SideMenuButton.swift
//  mentorz-clone-test
//
//  Created by craterzone on 28/02/21.
//

import UIKit
import SideMenu
class SideMenuButton: UIBarButtonItem {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUI()
    }
    private func setUI(){
        self.image = UIImage(named: "hamburger_Image")
        self.title = nil
        self.tintColor = .white
    }
}

