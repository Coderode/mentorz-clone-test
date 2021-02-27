//
//  DeviceInfo.swift
//  mentorz-clone-test
//
//  Created by craterzone on 27/02/21.
//

import Foundation
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
