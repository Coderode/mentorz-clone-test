//
//  MessagesVC.swift
//  mentorz-clone-test
//
//  Created by craterzone on 23/02/21.
//

import UIKit
import SideMenu
class MessagesVC: UIViewController {
    var menu : SideMenuNavigationController?
    @IBOutlet weak var sideMenuButton: SideMenuButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let sideBar = storyboard?.instantiateViewController(identifier: "SideBarMenuVC")
        menu = SideMenuNavigationController(rootViewController: sideBar!)
        menu?.leftSide = true
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        SideMenuManager.default.leftMenuNavigationController = menu
        menu?.setNavigationBarHidden(true, animated: true)
        menu?.menuWidth = self.view.frame.size.width * 3/4
        menu?.presentDuration = 0.8
    }
    @IBAction func didSideMenuButtonTap(_ sender: Any) {
        self.present(menu!, animated: true, completion: nil)
    }
}
