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



