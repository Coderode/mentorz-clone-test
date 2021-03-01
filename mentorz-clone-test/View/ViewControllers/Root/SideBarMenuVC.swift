//
//  SideBarVC.swift
//  mentorz-clone-test
//
//  Created by craterzone on 23/02/21.
//

import UIKit

class SideBarMenuVC: UIViewController {
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.addTopBorderWithColor(color: .gray, width: 1)
        logoutButton.addTarget(self, action: #selector(didLogoutButtonTapped), for: .touchUpInside)
    }
    @objc func didLogoutButtonTapped(){
        //user logout
        //....
        self.dismiss(animated: false, completion: nil)
        
    }
}
