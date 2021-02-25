

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields
import Moya
import MaterialComponents.MaterialActivityIndicator
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
    @IBOutlet weak var facebookButton: SocialLoginButton!
    @IBOutlet weak var linkedinButton: SocialLoginButton!
    @IBOutlet weak var appleButton: SocialLoginButton!
    
    private var loginPageVm: LoginPageVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        setSocialButtonType()
        self.loginPageVm = LoginPageVM(view: self)
        loginPageVm.setUI()
        loginPageVm.setTarget()
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.alpha = 0.1
        orLeftView.addTopBorderWithColor(color: .gray, width: 1)
        orRightView.addTopBorderWithColor(color: .gray, width: 1)
    }
    private func setSocialButtonType(){
        self.facebookButton.type = .facebook
        self.appleButton.type = .apple
        self.linkedinButton.type = .linkedin
    }
}
extension LoginPageVC: LoginPageView{
    func getMainVC() -> LoginPageVC {
        return self
    }
    func getCountryCodeTextField() -> MDCFilledTextField {
        return self.countryCodePicker
    }
    func getPhoneNumberTextField() -> MDCFilledTextField {
        return self.phoneNumber
    }
    
    func getPasswordTextField() -> MDCFilledTextField {
        return self.password
    }
    func getForgotPasswordButton() -> UIButton {
        return self.forgotPasswordButton
    }
    
    func getLoginButton() -> ButtonView {
        return self.loginButton
    }
    
    func getSignUpButton() -> BottomSwitchButton {
        return self.switchToSignupPageButton
    }
    
    func getTNCButton() -> LoginSignupBottomLinkButton {
        return self.bottomLinkButton
    }
    
}
