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
        self.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1)
    }
}
