//
//  LoginSignupTextField.swift
//  mentorz-clone-test
//
//  Created by craterzone on 22/02/21.
//

import Foundation
import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields

class LoginSignupTextField {
    static func textFieldDesign(_ textField : MDCFilledTextField,_ textToFill : String){
        textField.label.text = textToFill
        textField.setNormalLabelColor(UIColor.gray, for: MDCTextControlState.normal)
        textField.setNormalLabelColor(UIColor.black, for: MDCTextControlState.editing)
        textField.setFloatingLabelColor(UIColor.gray, for: MDCTextControlState.normal)
        textField.setFloatingLabelColor(UIColor.black, for: MDCTextControlState.editing)
        textField.setTextColor(UIColor.black, for: MDCTextControlState.editing)
        textField.setFilledBackgroundColor(UIColor.clear, for: MDCTextControlState.editing)
        textField.setFilledBackgroundColor(UIColor.clear, for: MDCTextControlState.normal)
        textField.tintColor = #colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1)
        textField.textColor = .black
        textField.setUnderlineColor(#colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1) , for: MDCTextControlState.editing)
        textField.setUnderlineColor(UIColor.gray, for: MDCTextControlState.normal)
        textField.font = UIFont.systemFont(ofSize: CGFloat(17))
    }
    
    static func countryCodePickerDesign(_ textField: MDCFilledTextField){
        textField.text = "+1"
        textField.label.text = "abc"
        textField.setNormalLabelColor(UIColor.gray, for: MDCTextControlState.normal)
        textField.setNormalLabelColor(UIColor.black, for: MDCTextControlState.editing)
        textField.setFloatingLabelColor(UIColor.gray, for: MDCTextControlState.normal)
        textField.setFloatingLabelColor(UIColor.black, for: MDCTextControlState.editing)
        textField.setTextColor(UIColor.black, for: MDCTextControlState.editing)
        textField.setFilledBackgroundColor(UIColor.clear, for: MDCTextControlState.editing)
        textField.setFilledBackgroundColor(UIColor.clear, for: MDCTextControlState.normal)
        textField.tintColor = #colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1)
        textField.textColor = .black
        textField.setUnderlineColor(#colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1) , for: MDCTextControlState.editing)
        textField.setUnderlineColor(UIColor.gray, for: MDCTextControlState.normal)
        textField.font = UIFont.systemFont(ofSize: CGFloat(17))
    }
}
