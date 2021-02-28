//
//  SideMenuButton.swift
//  mentorz-clone-test
//
//  Created by craterzone on 28/02/21.
//

import UIKit

protocol didTapSideMenuButton: class {
    func didTap()
}
class SideMenuButton: UIBarButtonItem {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUI()
    }
    weak var delegate: didTapSideMenuButton?
    @IBAction internal func didTap(){
        self.delegate?.didTap()
        print("action")
    }
    private func setUI(){
        self.image = UIImage(named: "hamburger_Image")
        self.title = nil
        self.tintColor = .white
    }
}
//extension SideMenuButton : didTapSideMenuButton {
//    func didTap(){
//        print("action")
//    }
//}
