//
//  UserProfile.swift
//  mentorz-clone-test
//
//  Created by craterzone on 27/02/21.
//

import Foundation
class BasicProfile: Codable {
    let birthDate, name, basicInfo, videoBioHres: String

    enum CodingKeys: String, CodingKey {
        case birthDate = "birth_date"
        case name
        case basicInfo = "basic_info"
        case videoBioHres = "video_bio_hres"
    }

    init(birthDate: String, name: String, basicInfo: String, videoBioHres: String) {
        self.birthDate = birthDate
        self.name = name
        self.basicInfo = basicInfo
        self.videoBioHres = videoBioHres
    }
}

