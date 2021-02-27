//
//  SignupRestManager.swift
//  mentorz-clone-test
//
//  Created by craterzone on 27/02/21.
//

import Foundation
import UIKit
import Moya

class SignupRequestManager {
    static func validateUser(signupObject: SignupRequest, handler: ((Result<SignupResponse, APIHitError>) -> Void)?){
        let provider = MoyaProvider<UserAccount>()
        // api hit over moya
        // moya will provide you the response
        // store that response in a vaiable
        // pass that variable as success object
        provider.request(.signup(signupDetail: signupObject)) { (result) in
            switch result{
            case .success(let response):
                do{
                    let responseString = try response.mapString()
                    let signupResponse = SignupResponse(JSONString: responseString)
                    if response.statusCode == 201 {
                        handler?(.success(signupResponse!))
                    }
                }catch {
                    let error = APIHitError("Server Error!",response.statusCode)
                    handler?(.failure(error))
                }
            case .failure(let moyaError):
                do{
                    //let errorCode = try moyaError.response?.mapString(atKeyPath: "error_code")
                    let errorMsg = try moyaError.response?.mapString(atKeyPath: "error_msg")
                    let error = APIHitError(errorMsg!,moyaError.errorCode)
                    handler?(.failure(error))
                }catch {
                    let error = APIHitError("Server Error!",500)
                    handler?(.failure(error))
                }
            }
        }
        
    }
}

