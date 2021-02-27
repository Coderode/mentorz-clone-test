//
//  SignupRequest.swift
//  mentorz-clone-test
//
//  Created by craterzone on 27/02/21.
//
import Foundation

class SignupRequest : Codable {
    let emailID: String
    let phoneNumber: SignupPhoneNumber
    let password: String
    let deviceInfo: DeviceInfo
    let userProfile: BasicProfile

    enum CodingKeys: String, CodingKey {
        case emailID = "email_id"
        case phoneNumber = "phone_number"
        case password
        case deviceInfo = "device_info"
        case userProfile = "user_profile"
    }

    init(emailID: String, phoneNumber: SignupPhoneNumber, password: String, deviceInfo: DeviceInfo, userProfile: BasicProfile) {
        self.emailID = emailID
        self.phoneNumber = phoneNumber
        self.password = password
        self.deviceInfo = deviceInfo
        self.userProfile = userProfile
    }
}


