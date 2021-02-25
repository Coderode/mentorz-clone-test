import Foundation
import ObjectMapper

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


