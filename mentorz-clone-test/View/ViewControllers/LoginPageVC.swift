

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
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.alpha = 0.1
        LoginSignupTextField.textFieldDesign(phoneNumber, "Phone number")
        LoginSignupTextField.textFieldDesign(password, "Password")
        LoginSignupTextField.countryCodePickerDesign(countryCodePicker)
        orLeftView.addTopBorderWithColor(color: .gray, width: 1)
        orRightView.addTopBorderWithColor(color: .gray, width: 1)
        forgotPasswordButton.addTarget(self, action: #selector(didForgotPasswordButtonTapped), for: .touchUpInside)
        switchToSignupPageButton.addTarget(self, action: #selector(didSwitchToSignupButtonTapped), for: .touchUpInside)
    }
    @objc func didForgotPasswordButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
//        weak var pvc = self.presentingViewController
//        self.dismiss(animated: false, completion: {
//            pvc?.present(nextViewController, animated: false, completion: nil)
//        })
    }
    @objc func didSwitchToSignupButtonTapped(){
        self.dismiss(animated: false, completion: nil)
    }
}
