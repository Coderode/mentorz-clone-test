//
//  RootTabBarVC.swift
//  mentorz-clone-test
//
//  Created by craterzone on 23/02/21.
//

import UIKit

class RootTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItems(self.tabBar)
    }
    
    private func setTabBarItems(_ tabBar : UITabBar) {
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = true
        tabBar.itemPositioning = .fill
        tabBar.tintColor = UIColor(red: 243/255, green: 45/255, blue: 55/255, alpha: 1)
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.sizeToFit()
    
        
        //tabBar.items![0].title = nil
//        tabBar.items![0].imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
//        tabBar.items![0].image = UIImage(named: "home-outline")
//        tabBar.items![0].selectedImage = UIImage(named: "home-filled")
//        tabBar.items![1].title = nil
 //       tabBar.items![1].imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
//        tabBar.items![1].image = UIImage(named: "search-outline")
//        tabBar.items![1].selectedImage = UIImage(named: "search-outline")
//        tabBar.items![2].title = nil
//        tabBar.items![2].imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
//        tabBar.items![2].image = UIImage(named: "reels-outline")
//        tabBar.items![2].selectedImage = UIImage(named: "reels-filled")
//        tabBar.items![3].title = nil
//        tabBar.items![3].imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
//        tabBar.items![3].image = UIImage(named: "heart-outline")
//        tabBar.items![3].selectedImage = UIImage(named: "heart-filled")
//        tabBar.items![4].title = nil
//        tabBar.items![4].imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
//        tabBar.items![4].image = UIImage(named: "profile-outline")
//        tabBar.items![4].selectedImage = UIImage(named: "profile-filled")
    }
}
