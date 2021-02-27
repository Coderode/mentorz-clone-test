//
//  SignupPageVM.swift
//  mentorz-clone-test
//
//  Created by craterzone on 27/02/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialActivityIndicator
import Moya
protocol SignupPageView: class {
    var getSignupButton : ButtonView { get }
    var getBackPageButton : BackButton { get }
    var getFirstNameTextField : MDCFilledTextField { get }
    var getLastNameTextField : MDCFilledTextField { get }
    var getCountryCodeTextField : MDCFilledTextField { get }
    var getPhoneNumberTextField :  MDCFilledTextField { get }
    var getPasswordTextField : MDCFilledTextField { get }
    var getEmailTextField : MDCFilledTextField { get }
    var getLoginButton : BottomSwitchButton { get }
    var getSignupPageVC : SignupPageVC { get }
}
class SignupPageVM: NSObject{
    var signupView: SignupPageView
    private let secureButton: UIButton = UIButton(type: .custom)
    private let activityIndicator = ActivityIndicatorService.get()
    private let provider = MoyaProvider<UserAccount>()
    private let alertService = MessageAlertService()
    
    init(view delegate: SignupPageView){
        self.signupView = delegate
    }
    
    public func setUI(){
        //secure or nonsecure password text field
        self.secureButton.setImage(UIImage(named: "eye_2"), for: .normal)
        self.secureButton.tintColor = .darkGray
        self.secureButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        self.secureButton.frame = CGRect(x: 0, y: 0, width: self.signupView.getPasswordTextField.frame.size.width/8, height: self.signupView.getPasswordTextField.frame.size.height)
        self.signupView.getPasswordTextField.trailingView = self.secureButton
        self.signupView.getPasswordTextField.trailingViewMode = .always
        self.signupView.getPasswordTextField.isSecureTextEntry = true
        self.signupView.getBackPageButton.titleLabel?.text = nil
        
        //text field designs
        LoginSignupTextField.textFieldDesign(self.signupView.getFirstNameTextField, "First name")
        LoginSignupTextField.textFieldDesign(self.signupView.getLastNameTextField, "Last name")
        LoginSignupTextField.countryCodePickerDesign(self.signupView.getCountryCodeTextField)
        LoginSignupTextField.textFieldDesign(self.signupView.getPhoneNumberTextField, "Phone number")
        LoginSignupTextField.textFieldDesign(self.signupView.getEmailTextField, "Enter your email address")
        LoginSignupTextField.textFieldDesign(self.signupView.getPasswordTextField, "Password")
    }
    
    public func setTarget(){
        self.secureButton.addTarget(self, action: #selector(self.btnPasswordVisibilityTapped), for: .touchUpInside)
        self.signupView.getLoginButton.addTarget(self, action: #selector(didSwitchToLoginButtonTapped), for: .touchUpInside)
        self.signupView.getBackPageButton.addTarget(self, action: #selector(didBackPageButtonTapped), for: .touchUpInside)
        self.signupView.getSignupButton.addTarget(self, action: #selector(didSignupButtonTapped), for: .touchUpInside)
    }

    @objc func btnPasswordVisibilityTapped(_ sender : Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.signupView.getPasswordTextField.isSecureTextEntry = false
            self.secureButton.setImage(UIImage(named: "eye"), for: .normal)
        }else{
            self.signupView.getPasswordTextField.isSecureTextEntry = true
            self.secureButton.setImage(UIImage(named: "eye_2"), for: .normal)
        }
    }
    
    
    @objc func didSwitchToLoginButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginPageVC") as! LoginPageVC
        nextViewController.modalPresentationStyle = .fullScreen
        weak var pvc = self.signupView.getSignupPageVC.presentingViewController
        self.signupView.getSignupPageVC.dismiss(animated: false, completion: {
            pvc?.present(nextViewController, animated: false, completion: nil)
        })
    }
    @objc func didBackPageButtonTapped(){
        self.signupView.getSignupPageVC.dismiss(animated: false, completion: nil)
    }
    
    @objc func didSignupButtonTapped(){
        if !validateTextFields() {
            return
        }
        //print("Signup")
        
        //getting data from the form input
        let firstName = self.signupView.getFirstNameTextField.text!
        let lastName = self.signupView.getLastNameTextField.text!
        let phone = SignupPhoneNumber(cc: "91", isoAlpha2_Cc: "in", number: self.signupView.getPhoneNumberTextField.text!)
        let email = self.signupView.getEmailTextField.text!
        let password = self.signupView.getPasswordTextField.text!
        let deviceInfo = DeviceInfo(deviceToken: "test_token", deviceType: "IOS")
        let userProfile = BasicProfile(birthDate: "", name: firstName+" "+lastName, basicInfo: "", videoBioHres: "")
        
        let userDetails = SignupRequest(emailID: email, phoneNumber: phone, password: password, deviceInfo: deviceInfo, userProfile: userProfile)
        //start activity indicator
        self.activityIndicator.startIndicator(self.signupView.getSignupPageVC)
        SignupRequestManager.validateUser(signupObject: userDetails) { (response) in
            //stop activity indicator
            self.activityIndicator.stopIndicator(self.signupView.getSignupPageVC)
            switch response {
            case.success(let signupResponse):
                //print("Valid user")
                //on signup successful
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SideBarMenuVC") as! SideBarMenuVC
                nextViewController.modalPresentationStyle = .fullScreen
                weak var pvc = self.signupView.getSignupPageVC.presentingViewController
                self.signupView.getSignupPageVC.dismiss(animated: false, completion: {
                    pvc?.present(nextViewController, animated: false, completion: nil)
                })
            case.failure(let error):
                self.errorHandler(error: error)
            }
        }
    }
   
    
    private func errorHandler(error: APIHitError){
        var alertVc : MessageAlert?
        if error.errorCode == 409 {
            alertVc = alertService.alert(title: "Alert", desc: error.errorDescription, buttonTitle: "Login"){
                //self.signupView.getSignupPageVC.dismiss(animated: false, completion: nil)
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginPageVC") as! LoginPageVC
                nextViewController.modalPresentationStyle = .fullScreen
                weak var pvc = self.signupView.getSignupPageVC.presentingViewController
                self.signupView.getSignupPageVC.dismiss(animated: false, completion: {
                    pvc?.present(nextViewController, animated: false, completion: nil)
                })
            }
        }else{
            alertVc = alertService.alert(title: "Alert", desc: error.errorDescription, buttonTitle: "OK"){}
        }
        alertVc?.show(self.signupView.getSignupPageVC)
    }
    
    private func validateTextFields() -> Bool{
        let phoneNumber : Int? = Int(self.signupView.getPhoneNumberTextField.text ?? "")
        let password : String? = self.signupView.getPasswordTextField.text
        let firstName : String? = self.signupView.getFirstNameTextField.text
        let email : String? = self.signupView.getEmailTextField.text
        
        var error : String?
        var alertVc : MessageAlert?
        //is empty firstname
        //is empty phonenumber + phonenumber.count >= 6 <= 12
        //is empty email + valid email entry
        //is empty password validation + count >= 6
    
        if firstName == "" {
            error = "Please enter your name"
        }else if phoneNumber == nil {
            error = "Please enter a phone number"
        }else if String(phoneNumber ?? 0 ).count < 6 || String(phoneNumber ?? 0).count > 12 {
            error = "Please enter a valid phone number"
        }else if email == "" {
            error = "Please enter a email"
        }else if !(email!.isValidEmail()) {
            error = "Please enter a valid email"
        }else if password == "" {
            error = "Please enter a password"
        }else if password!.count < 6 {
            error = "Password too short. Minimum 6 characters are allowed"
        }
        if error != nil {
            alertVc = alertService.alert(title: "Message", desc: error!, buttonTitle: "OK"){}
            alertVc?.show(self.signupView.getSignupPageVC)
            return false
        }
        return true
    }

}
