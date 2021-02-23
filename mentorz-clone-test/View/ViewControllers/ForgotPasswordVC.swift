import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields

class ForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    @IBOutlet weak var countryCode: MDCFilledTextField!
    
    @IBOutlet weak var phoneNumber: MDCFilledTextField!
    @IBOutlet weak var continueButton: ButtonView!
    
    @IBOutlet weak var loginPageSwitchButton: BottomSwitchButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.alpha = 0.1
        
        LoginSignupTextField.textFieldDesign(phoneNumber, "Phone number")
        LoginSignupTextField.countryCodePickerDesign(countryCode)
        
        loginPageSwitchButton.addTarget(self, action: #selector(loginPageSwitchButtonTapped), for: .touchUpInside)
    }
    @objc func loginPageSwitchButtonTapped(){
        self.dismiss(animated: false, completion: nil)
    }
}
