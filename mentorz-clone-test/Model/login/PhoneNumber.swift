//
//  PhoneNumber.swift
//  mentorz-clone-test
//
//  Created by craterzone on 25/02/21.
//

import Foundation
import ObjectMapper
//PhoneNumber
class PhoneNumber: NSObject, Codable,Mappable {
    var cc, isoAlpha2_Cc: String?
    var number: Int?
    override init() {
        super.init()
    }
    convenience init(cc: String, isoAlpha2_Cc: String, number: Int) {
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
