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
    private let activityIndicator = ActivityIndicatorService.get()
    private let provider = MoyaProvider<UserAccount>()
    private let alertService = MessageAlertService()
    
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
    
    
    @objc func didLoginButtonTapped(){
        if !self.validateTextFields() {
            return
        }
        //getting data from the form input
        let phone = PhoneNumber(cc: "91", isoAlpha2_Cc: "in", number: Int(self.loginView.getPhoneNumberTextField().text!)!)
        let deviceInfo = DeviceInfo(deviceToken: "test_token", deviceType: "ANDROID")
        let userDetails = LoginRequest(emailID: "", phoneNumber: phone, password: self.loginView.getPasswordTextField().text!, deviceInfo: deviceInfo)
        //start activity indicator
        self.activityIndicator.startIndicator(self.loginView.getMainVC())
        LoginRestManager.validateUser(loginObject: userDetails) { (response) in
            //stop activity indicator
            self.activityIndicator.stopIndicator(self.loginView.getMainVC())
            
            switch response {
            case.success(let loginResponse):
                //print("Valid user")
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
    
    private func errorHandler(error: APIHitError){
        var alertVc : MessageAlert?
        if error.errorCode == 404 {
            alertVc = alertService.alert(title: "Alert", desc: error.errorDescription, buttonTitle: "Sign up"){
                self.loginView.getMainVC().dismiss(animated: false, completion: nil)
            }
        }else{
            alertVc = alertService.alert(title: "Alert", desc: error.errorDescription, buttonTitle: "OK"){}
        }
        alertVc?.show(self.loginView.getMainVC())
    }
    
    private func validateTextFields() -> Bool{
        let phoneNumberTextField = self.loginView.getPhoneNumberTextField()
        let passwordTextField = self.loginView.getPasswordTextField()
        let phoneNumber : Int? = Int(phoneNumberTextField.text ?? "")
        let password : String? = passwordTextField.text
        var error : String?
        var alertVc : MessageAlert?
        //is empty phonenumber validation
        //is empty password validation
        //password length validation
        if phoneNumber == nil {
            error = "Please enter email or phone number"
        }else if password == "" {
            error = "Please enter a password"
        }else if password!.count < 6 {
            error = "Password too short. Minimum 6 characters are allowed"
        }
        
        if error != nil {
            alertVc = alertService.alert(title: "Message", desc: error!, buttonTitle: "OK"){}
            alertVc?.show(self.loginView.getMainVC())
            return false
        }
        return true
    }

}
