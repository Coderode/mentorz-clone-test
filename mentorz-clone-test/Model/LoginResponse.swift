import Foundation


// MARK: - Welcome
class LoginResponse: Codable {
    let userID: Int
    let emailID, userName: String
    let userProfile: UserProfile
    let authToken: String
    let isAccountDeactivated, hasInterests, hasValues: Bool
    let phoneNumber: PhoneNumber
    let isNumberVerified: Bool
    let chatToken, name: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case emailID = "email_id"
        case userName = "user_name"
        case userProfile = "user_profile"
        case authToken = "auth_token"
        case isAccountDeactivated = "is_account_deactivated"
        case hasInterests = "has_interests"
        case hasValues = "has_values"
        case phoneNumber = "phone_number"
        case isNumberVerified = "is_number_verified"
        case chatToken = "chat_token"
        case name
    }

    init(userID: Int, emailID: String, userName: String, userProfile: UserProfile, authToken: String, isAccountDeactivated: Bool, hasInterests: Bool, hasValues: Bool, phoneNumber: PhoneNumber, isNumberVerified: Bool, chatToken: String, name: String) {
        self.userID = userID
        self.emailID = emailID
        self.userName = userName
        self.userProfile = userProfile
        self.authToken = authToken
        self.isAccountDeactivated = isAccountDeactivated
        self.hasInterests = hasInterests
        self.hasValues = hasValues
        self.phoneNumber = phoneNumber
        self.isNumberVerified = isNumberVerified
        self.chatToken = chatToken
        self.name = name
    }
}

/*// MARK: - PhoneNumber
class PhoneNumber: Codable {
    let cc, isoAlpha2_Cc, number: String

    enum CodingKeys: String, CodingKey {
        case cc
        case isoAlpha2_Cc = "iso_alpha_2_cc"
        case number
    }

    init(cc: String, isoAlpha2_Cc: String, number: String) {
        self.cc = cc
        self.isoAlpha2_Cc = isoAlpha2_Cc
        self.number = number
    }
}
 */

// MARK: - UserProfile
class UserProfile: Codable {
    let followers, following, mentors, mentees: Int
    let basicInfo: String
    let birthDate, chargePrice, requests: Int
    let videoBioHres, name: String
    let noofpost: Int

    enum CodingKeys: String, CodingKey {
        case followers, following, mentors, mentees
        case basicInfo = "basic_info"
        case birthDate = "birth_date"
        case chargePrice = "charge_price"
        case requests
        case videoBioHres = "video_bio_hres"
        case name, noofpost
    }

    init(followers: Int, following: Int, mentors: Int, mentees: Int, basicInfo: String, birthDate: Int, chargePrice: Int, requests: Int, videoBioHres: String, name: String, noofpost: Int) {
        self.followers = followers
        self.following = following
        self.mentors = mentors
        self.mentees = mentees
        self.basicInfo = basicInfo
        self.birthDate = birthDate
        self.chargePrice = chargePrice
        self.requests = requests
        self.videoBioHres = videoBioHres
        self.name = name
        self.noofpost = noofpost
    }
}
