import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields

class SignupPageVC: UIViewController {

    @IBOutlet weak var backPageButton: BackButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var firstNameTextField: MDCFilledTextField!
    @IBOutlet weak var lastNameTextField: MDCFilledTextField!
    @IBOutlet weak var countryCode: MDCFilledTextField!
    @IBOutlet weak var phoneNumber: MDCFilledTextField!
    @IBOutlet weak var emailAddress: MDCFilledTextField!
    @IBOutlet weak var password: MDCFilledTextField!
    @IBOutlet weak var signupButton: ButtonView!
    @IBOutlet weak var loginPageSwitch: BottomSwitchButton!
    let secureButton = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.alpha = 0.1
        LoginSignupTextField.textFieldDesign(firstNameTextField, "First name")
        LoginSignupTextField.textFieldDesign(lastNameTextField, "Last name")
        LoginSignupTextField.countryCodePickerDesign(countryCode)
        LoginSignupTextField.textFieldDesign(phoneNumber, "Phone number")
        LoginSignupTextField.textFieldDesign(emailAddress, "Enter your email address")
        LoginSignupTextField.textFieldDesign(password, "Password")
        
        //secure or nonsecure password text field
        self.secureButton.setImage(UIImage(named: "eye_2"), for: .normal)
        self.secureButton.tintColor = .darkGray
        self.secureButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        self.secureButton.frame = CGRect(x: 0, y: 0, width: self.password.frame.size.width/8, height: self.password.frame.size.height)
        self.secureButton.addTarget(self, action: #selector(self.btnPasswordVisibilityTapped), for: .touchUpInside)
        self.password.trailingView = self.secureButton
        self.password.trailingViewMode = .always
        self.password.isSecureTextEntry = true
        
        
        //actions
        loginPageSwitch.addTarget(self, action: #selector(loginPageSwitchButtonTapped), for: .touchUpInside)
        backPageButton.addTarget(self, action: #selector(backPageButtonTapped), for: .touchUpInside)
        backPageButton.titleLabel?.text = nil
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
    
    @objc func loginPageSwitchButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginPageVC") as! LoginPageVC
        nextViewController.modalPresentationStyle = .fullScreen
        weak var pvc = self.presentingViewController
        self.dismiss(animated: false, completion: {
            pvc?.present(nextViewController, animated: false, completion: nil)
        })
    }
    @objc func backPageButtonTapped(){
        self.dismiss(animated: false, completion: nil)
    }

}
