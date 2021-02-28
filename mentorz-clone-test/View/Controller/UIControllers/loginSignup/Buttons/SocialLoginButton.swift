//
//  SocialLoginButtons.swift
//  mentorz-clone-test
//
//  Created by craterzone on 25/02/21.
//

import UIKit
enum SocialButton{
    case facebook
    case linkedin
    case apple
}
protocol didTapSocialButton: class {
    func didTap(type: SocialButton)
}
class SocialLoginButton : UIButton{
    public var type: SocialButton = .facebook {
        didSet{
            self.setUI(type: self.type)
        }
    }
    weak var delegate: didTapSocialButton?
    @IBAction private func didTap(){
        self.delegate?.didTap(type: self.type)
    }
    private func setUI(type: SocialButton){
        switch type {
        case .apple:
            self.setCommonUI()
            self.backgroundColor = UIColor.black
            self.setImage(UIImage(named: "apple-logo"), for: UIControl.State.normal)
            self.setTitle("Apple", for: UIControl.State.normal)
        case .facebook:
            self.setCommonUI()
            self.backgroundColor = UIColor(red: 57/255, green: 90/255, blue: 147/255, alpha: 1)
            self.setImage(UIImage(named: "fb"), for: UIControl.State.normal)
            self.setTitle("Facebook", for: UIControl.State.normal)
        case .linkedin:
            self.setCommonUI()
            self.backgroundColor = UIColor(red: 0/255, green: 121/255, blue: 176/255, alpha: 1)
            self.setImage(UIImage(named: "linkedin-1"), for: UIControl.State.normal)
            self.setTitle("Linkedin", for: UIControl.State.normal)
        }
    }
    private func setCommonUI(){
        self.layer.cornerRadius = 5
        self.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.titleLabel!.font = UIFont.systemFont(ofSize: CGFloat(18))
        self.tintColor = .white
        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
        self.contentEdgeInsets = UIEdgeInsets(top: 0,left: 2,bottom: 0,right: 5)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}
