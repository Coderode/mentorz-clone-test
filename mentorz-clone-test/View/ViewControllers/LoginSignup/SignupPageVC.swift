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
    
    private var signupPageVM : SignupPageVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.alpha = 0.1
        self.signupPageVM = SignupPageVM(view : self)
        self.signupPageVM.setUI()
        self.signupPageVM.setTarget()
    }
}


extension SignupPageVC : SignupPageView {
    var getSignupButton: ButtonView {
        return self.signupButton
    }
    
    var getBackPageButton: BackButton {
        return self.backPageButton
    }
    
    var getFirstNameTextField: MDCFilledTextField {
        return self.firstNameTextField
    }
    
    var getLastNameTextField: MDCFilledTextField {
        return self.lastNameTextField
    }
    
    var getCountryCodeTextField: MDCFilledTextField {
        return self.countryCode
    }
    
    var getPhoneNumberTextField: MDCFilledTextField {
        return self.phoneNumber
    }
    
    var getPasswordTextField: MDCFilledTextField {
        return self.password
    }
    
    var getEmailTextField: MDCFilledTextField {
        return self.emailAddress
    }
    
    var getLoginButton: BottomSwitchButton {
        return self.loginPageSwitch
    }
    
    var getSignupPageVC: SignupPageVC {
        return self
    }
    
}
