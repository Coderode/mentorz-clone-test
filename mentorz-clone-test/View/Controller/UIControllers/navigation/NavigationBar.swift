//
//  NavigationBar.swift
//  mentorz-clone-test
//
//  Created by craterzone on 28/02/21.
//

import UIKit

class NavigationBar: UINavigationBar {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUI()
    }
    
    private func setUI(){
        self.backgroundColor = UIColor(red: 243/255, green: 45/255, blue: 55/255, alpha: 1)
        self.barTintColor = UIColor(red: 243/255, green: 45/255, blue: 55/255, alpha: 1)
        self.tintColor = .white
    }
}
