//
//  Mentorz.swift
//  mentorz-clone-test
//
//  Created by craterzone on 24/02/21.
//

import Foundation
import Moya


enum UserAccount {
    case login(loginDetail : LoginRequest?)
}

extension UserAccount : TargetType {
    public var baseURL: URL {
        return URL(string: "http://stgapp.mentorz.com:8080/mentorz/api/v3")!
    }
    
    public var path: String {
        switch self {
        case .login(loginDetail: _) :
            return "/user/login"
        }
    }
    
    public var method: Moya.Method {
        switch self{
        case .login : return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(loginDetail: let details) :
            
            let queryParam : [String : Any] = [
                 "email_id":"",
                 "phone_number":[
                    "cc":details?.phoneNumber.cc as Any,
                    "iso_alpha_2_cc":details?.phoneNumber.isoAlpha2_Cc as Any,
                    "number":details?.phoneNumber.number as Any
                 ],
                "password":details?.password as Any,
                 "device_info":[
                    "device_token":details?.deviceInfo.deviceToken,
                    "device_type":details?.deviceInfo.deviceType]
            ]
            return .requestParameters(parameters: queryParam, encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
}
