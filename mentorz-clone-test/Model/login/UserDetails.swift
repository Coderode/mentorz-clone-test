//
//  UserDetails.swift
//  mentorz-clone-test
//
//  Created by craterzone on 25/02/21.
//

import Foundation
import ObjectMapper
//UserProfile
class UserProfile: NSObject,Mappable {
    var followers : Int?
    var following : Int?
    var mentors : Int?
    var mentees : Int?
    var basicInfo : String?
    var birthDate : Int?
    var chargePrice : Int?
    var requests : Int?
    var videoBioHres : String?
    var name : String?
    var noofpost : Int?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        followers <- map["followers"]
        following <- map["following"]
        mentors <- map["mentors"]
        mentees <- map["mentees"]
        basicInfo <- map["basic_info"]
        birthDate <- map["birth_date"]
        chargePrice <- map["charge_price"]
        requests <- map["requests"]
        videoBioHres <- map["video_bio_hres"]
        name <- map["name"]
        noofpost <- map["noofpost"]
    }


}
