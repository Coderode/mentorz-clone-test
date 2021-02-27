import Foundation
import ObjectMapper
//on successful login 
class LoginResponse: NSObject,Mappable {
    var userId : Int?
    var emailId : String?
    var userName : String?
    var userProfile : UserProfile?
    var authToken : String?
    var isAccountDeactivated : Bool?
    var hasInterests : Bool?
    var hasValues : Bool?
    var phoneNumber : PhoneNumber?
    var isNumberVerified : Bool?
    var chatToken : String?
    var name : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        userId <- map["user_id"]
        emailId <- map["email_id"]
        userName <- map["user_name"]
        userProfile <- map["user_profile"]
        authToken <- map["auth_token"]
        isAccountDeactivated <- map["is_account_deactivated"]
        hasInterests <- map["has_interests"]
        hasValues <- map["has_values"]
        phoneNumber <- map["phone_number"]
        isNumberVerified <- map["is_number_verified"]
        chatToken <- map["chat_token"]
        name <- map["name"]
    }
    
}


