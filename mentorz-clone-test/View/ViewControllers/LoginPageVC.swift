

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields

class LoginPageVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var phoneNumber: MDCFilledTextField!
    @IBOutlet weak var password: MDCFilledTextField!
    @IBOutlet weak var countryCodePicker: MDCFilledTextField!
    @IBOutlet weak var loginButton: ButtonView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var orLeftView: UIView!
    @IBOutlet weak var orRightView: UIView!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var switchToSignupPageButton: BottomSwitchButton!
    @IBOutlet weak var bottomLinkButton: LoginSignupBottomLinkButton!
    let secureButton = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.alpha = 0.1
        LoginSignupTextField.textFieldDesign(phoneNumber, "Phone number")
        LoginSignupTextField.textFieldDesign(password,"Password")
        LoginSignupTextField.countryCodePickerDesign(countryCodePicker)
        orLeftView.addTopBorderWithColor(color: .gray, width: 1)
        orRightView.addTopBorderWithColor(color: .gray, width: 1)
        
        //password secure or nonsecure
        self.secureButton.setImage(UIImage(named: "eye_2"), for: .normal)
        self.secureButton.tintColor = .darkGray
        self.secureButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        self.secureButton.frame = CGRect(x: 0, y: 0, width: self.password.frame.size.width/8, height: self.password.frame.size.height)
        self.secureButton.addTarget(self, action: #selector(self.btnPasswordVisibilityTapped), for: .touchUpInside)
        self.password.trailingView = self.secureButton
        self.password.trailingViewMode = .always
        self.password.isSecureTextEntry = true
        
        //actions
        forgotPasswordButton.addTarget(self, action: #selector(didForgotPasswordButtonTapped), for: .touchUpInside)
        switchToSignupPageButton.addTarget(self, action: #selector(didSwitchToSignupButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(didLoginButtonTapped), for: .touchUpInside)
    }
    @objc func btnPasswordVisibilityTapped(_ sender : Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            password.isSecureTextEntry = false
            secureButton.setImage(UIImage(named: "eye"), for: .normal)
        }else{
            password.isSecureTextEntry = true
            secureButton.setImage(UIImage(named: "eye_2"), for: .normal)
        }
    }
    @objc func didForgotPasswordButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
    @objc func didSwitchToSignupButtonTapped(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func didLoginButtonTapped(){
        //user login
        //...
        //...
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SideBarMenuVC") as! SideBarMenuVC
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
}
