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
        loginPageSwitch.addTarget(self, action: #selector(loginPageSwitchButtonTapped), for: .touchUpInside)
        backPageButton.addTarget(self, action: #selector(backPageButtonTapped), for: .touchUpInside)
        backPageButton.titleLabel?.text = nil
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
