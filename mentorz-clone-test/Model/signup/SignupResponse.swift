//
//  SignupResponse.swift
//  mentorz-clone-test
//
//  Created by craterzone on 27/02/21.
//
// on successful creation of account (signup)
import Foundation
import ObjectMapper

class SignupResponse :  NSObject,Mappable {
    var userID: Int?
    var emailID, userName: String?
    var deviceInfo: SignupDeviceInfo?
    var userProfile: UserProfile?
    var authToken: String?
    var phoneNumber: SignupPhoneNumber?
    var channels: Channels?
    var name: String?

    
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        userID <- map["user_id"]
        emailID <- map["email_id"]
        userName <- map["user_name"]
        deviceInfo <- map["device_info"]
        userProfile <- map["user_profile"]
        authToken <- map["auth_token"]
        phoneNumber <- map["phone_number"]
        channels <- map["channels"]
        name <- map["name"]
    }
}

class Channels:  NSObject,Mappable {
    var channelGroupName, channelName: String?
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        channelGroupName <- map["channel_group_name"]
        channelName <- map["channel_name"]
    }
}

class SignupDeviceInfo:  NSObject,Mappable {
    var userAgent, deviceToken, deviceType: String?
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        deviceToken <- map["device_token"]
        deviceType <- map["device_type"]
        userAgent <- map["userAgent"]
    }
}

class SignupPhoneNumber:  NSObject,Mappable,Codable {
    var cc, isoAlpha2_Cc, number: String?
    override init() {
        super.init()
    }
    convenience init(cc: String, isoAlpha2_Cc: String, number: String) {
        self.init()
        self.cc = cc
        self.isoAlpha2_Cc = isoAlpha2_Cc
        self.number = number
    }
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {

        cc <- map["cc"]
        isoAlpha2_Cc <- map["iso_alpha_2_cc"]
        number <- map["number"]
    }
}

