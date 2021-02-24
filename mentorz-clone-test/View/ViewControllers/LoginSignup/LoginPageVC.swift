

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
    let secureButton = UIButton(type: .custom)
    
    private let provider = MoyaProvider<UserAccount>()
    private let activityIndicator = MDCActivityIndicator()
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
        
        //activity indicator
        activityIndicator.sizeToFit()
        activityIndicator.indicatorMode = .indeterminate
        //activityIndicator.backgroundColor = .white
        activityIndicator.cycleColors = [#colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1)]
        let viewHeight = self.view.frame.height
        let viewWidth = self.view.frame.width
        activityIndicator.frame = CGRect(x: viewWidth/2 - viewWidth/8, y: viewHeight/2 - viewWidth/8, width: viewWidth/4, height: viewWidth/4)
        self.view.addSubview(activityIndicator)
        
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
        self.activityIndicator.startAnimating()
        //getting data from the form input
        let phone = PhoneNumber(cc: "91", isoAlpha2_Cc: "in", number: Int(self.phoneNumber.text!)!)
        let deviceInfo = DeviceInfo(deviceToken: "test_token", deviceType: "ANDROID")
        let userDetails = LoginRequest(emailID: "", phoneNumber: phone, password: self.password.text!, deviceInfo: deviceInfo)

        provider.request(.login(loginDetail: userDetails)) { (result) in
            self.activityIndicator.stopAnimating()
            switch result{
            case .success(let response):
                do{
                    //let jsonDecoder = JSONDecoder()
                    //let loginResponse = try jsonDecoder.decode(LoginResponse.self, from: response.data)
                    //print(loginResponse.name)
                    //print(try response.mapJSON())
                    //print(response.statusCode)
                    if response.statusCode == 200 {
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SideBarMenuVC") as! SideBarMenuVC
                        nextViewController.modalPresentationStyle = .fullScreen
                        self.present(nextViewController, animated: false, completion: nil)
                    }
                }catch let parsingError{
                    print("ERROR!")
                    print(parsingError.localizedDescription)
                    print(response.statusCode)
                }
                
            case .failure(let moyaError):
                print("Failed")
                ///print(moyaError.errorCode)
                //print(moyaError.errorUserInfo)
                print(moyaError.errorDescription!)
                
            }
        }
    }
}
