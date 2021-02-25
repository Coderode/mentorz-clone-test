//
//  LoginPageVM.swift
//  mentorz-clone-test
//
//  Created by craterzone on 25/02/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialActivityIndicator
import Moya
protocol LoginPageView: class {
    func getCountryCodeTextField() -> MDCFilledTextField
    func getPhoneNumberTextField() -> MDCFilledTextField
    func getPasswordTextField() -> MDCFilledTextField
    func getForgotPasswordButton() -> UIButton
    func getLoginButton() -> ButtonView
    func getSignUpButton() -> BottomSwitchButton
    func getTNCButton() -> LoginSignupBottomLinkButton
    func getMainVC() -> LoginPageVC
}
class LoginPageVM: NSObject{
    var loginView: LoginPageView
    private let secureButton: UIButton = UIButton(type: .custom)
    private let activityIndicator = MDCActivityIndicator()
    private let provider = MoyaProvider<UserAccount>()
    init(view delegate: LoginPageView){
        self.loginView = delegate
    }
    
    public func setUI(){
        
        //setting textField design
        LoginSignupTextField.textFieldDesign(self.loginView.getPhoneNumberTextField(), "Phone number")
        LoginSignupTextField.textFieldDesign(self.loginView.getPasswordTextField(),"Password")
        LoginSignupTextField.countryCodePickerDesign(self.loginView.getCountryCodeTextField())
        
        //password secure or nonsecure
        self.secureButton.setImage(UIImage(named: "eye_2"), for: .normal)
        self.secureButton.tintColor = .darkGray
        self.secureButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        self.secureButton.frame = CGRect(x: 0, y: 0, width: self.loginView.getPasswordTextField().frame.size.width/8, height: self.loginView.getPasswordTextField().frame.size.height)
        self.loginView.getPasswordTextField().trailingView = self.secureButton
        self.loginView.getPasswordTextField().trailingViewMode = .always
        self.loginView.getPasswordTextField().isSecureTextEntry = true
        
        //activity indicator
        activityIndicator.sizeToFit()
        activityIndicator.indicatorMode = .indeterminate
        activityIndicator.cycleColors = [#colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1)]
        let viewHeight = self.loginView.getMainVC().view.frame.height
        let viewWidth = self.loginView.getMainVC().view.frame.width
        activityIndicator.frame = CGRect(x: viewWidth/2 - viewWidth/8, y: viewHeight/2 - viewWidth/8, width: viewWidth/4, height: viewWidth/4)
        self.loginView.getMainVC().view.addSubview(activityIndicator)
    }
    
    public func setTarget(){
        self.secureButton.addTarget(self, action: #selector(self.btnPasswordVisibilityTapped), for: .touchUpInside)
        self.loginView.getForgotPasswordButton().addTarget(self, action: #selector(didForgotPasswordButtonTapped), for: .touchUpInside)
        self.loginView.getSignUpButton().addTarget(self, action: #selector(didSwitchToSignupButtonTapped), for: .touchUpInside)
        self.loginView.getLoginButton().addTarget(self, action: #selector(didLoginButtonTapped), for: .touchUpInside)
    }
    //actions
    @objc func btnPasswordVisibilityTapped(_ sender : Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.loginView.getPasswordTextField().isSecureTextEntry = false
            self.secureButton.setImage(UIImage(named: "eye"), for: .normal)
        }else{
            self.loginView.getPasswordTextField().isSecureTextEntry = true
            self.secureButton.setImage(UIImage(named: "eye_2"), for: .normal)
        }
    }
    
    @objc func didForgotPasswordButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        nextViewController.modalPresentationStyle = .fullScreen
        self.loginView.getMainVC().present(nextViewController, animated: false, completion: nil)
    }
    @objc func didSwitchToSignupButtonTapped(){
        self.loginView.getMainVC().dismiss(animated: false, completion: nil)
    }
    private func errorHandler(error: APIHitError){
        guard let parentVC = self.loginView as? UIViewController else { return }
        //alertVC <- will show the error as a popup
    }
    
    @objc func didLoginButtonTapped(){
        //getting data from the form input
        let phone = PhoneNumber(cc: "91", isoAlpha2_Cc: "in", number: Int(self.loginView.getPhoneNumberTextField().text!)!)
        let deviceInfo = DeviceInfo(deviceToken: "test_token", deviceType: "ANDROID")
        let userDetails = LoginRequest(emailID: "", phoneNumber: phone, password: self.loginView.getPasswordTextField().text!, deviceInfo: deviceInfo)
        //start activity indicator
        self.activityIndicator.startAnimating()
        self.loginView.getMainVC().view.isUserInteractionEnabled = false
        LoginRestManager.validateUser(loginObject: userDetails) { (response) in
            //stop activity indicator
            self.activityIndicator.stopAnimating()
            self.loginView.getMainVC().view.isUserInteractionEnabled = true
            
            switch response {
            case.success(let loginResponse):
                print("Valid user")
                //on login successful
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SideBarMenuVC") as! SideBarMenuVC
                nextViewController.modalPresentationStyle = .fullScreen
                self.loginView.getMainVC().present(nextViewController, animated: false, completion: nil)
            case.failure(let error):
                self.errorHandler(error: error)
            }
        }
    }

}
