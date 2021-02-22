

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields

class LoginPageVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var phoneNumber: MDCFilledTextField!
    
    @IBOutlet weak var password: MDCFilledTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.alpha = 0.1
        phoneNumber.label.text = "Phone number"
        phoneNumber.setNormalLabelColor(UIColor.gray, for: MDCTextControlState.normal)
        phoneNumber.setNormalLabelColor(UIColor.black, for: MDCTextControlState.editing)
        phoneNumber.setFloatingLabelColor(UIColor.gray, for: MDCTextControlState.normal)
        phoneNumber.setFloatingLabelColor(UIColor.black, for: MDCTextControlState.editing)
        phoneNumber.setTextColor(UIColor.black, for: MDCTextControlState.editing)
        phoneNumber.setFilledBackgroundColor(UIColor.clear, for: MDCTextControlState.editing)
        phoneNumber.setFilledBackgroundColor(UIColor.clear, for: MDCTextControlState.normal)
        phoneNumber.tintColor = #colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1)
        phoneNumber.textColor = .black
        phoneNumber.setUnderlineColor(#colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1) , for: MDCTextControlState.editing)
        phoneNumber.setUnderlineColor(UIColor.gray, for: MDCTextControlState.normal)
        phoneNumber.font = UIFont.systemFont(ofSize: CGFloat(17))
        password.label.text = "Password"
    }
}
