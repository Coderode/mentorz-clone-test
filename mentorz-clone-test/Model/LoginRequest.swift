import Foundation

// MARK: - Welcome
class LoginRequest: Codable {
    let emailID: String
    let phoneNumber: PhoneNumber
    let password: String
    let deviceInfo: DeviceInfo

    enum CodingKeys: String, CodingKey {
        case emailID = "email_id"
        case phoneNumber = "phone_number"
        case password
        case deviceInfo = "device_info"
    }

    init(emailID: String, phoneNumber: PhoneNumber, password: String, deviceInfo: DeviceInfo) {
        self.emailID = emailID
        self.phoneNumber = phoneNumber
        self.password = password
        self.deviceInfo = deviceInfo
    }
}

// MARK: - DeviceInfo
class DeviceInfo: Codable {
    let deviceToken, deviceType: String

    enum CodingKeys: String, CodingKey {
        case deviceToken = "device_token"
        case deviceType = "device_type"
    }

    init(deviceToken: String, deviceType: String) {
        self.deviceToken = deviceToken
        self.deviceType = deviceType
    }
}

// MARK: - PhoneNumber
class PhoneNumber: Codable {
    let cc, isoAlpha2_Cc: String
    let number: Int

    enum CodingKeys: String, CodingKey {
        case cc
        case isoAlpha2_Cc = "iso_alpha_2_cc"
        case number
    }

    init(cc: String, isoAlpha2_Cc: String, number: Int) {
        self.cc = cc
        self.isoAlpha2_Cc = isoAlpha2_Cc
        self.number = number
    }
}

