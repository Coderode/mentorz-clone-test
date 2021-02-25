import UIKit
import Moya

class LoginRestManager {
    static func validateUser(loginObject: LoginRequest, handler: ((Result<LoginResponse, APIHitError>) -> Void)?){
        let provider = MoyaProvider<UserAccount>()
        // api hit over moya
        // moya will provide you the response
        // store that response in a vaiable
        // pass that variable as success object
        provider.request(.login(loginDetail: loginObject)) { (result) in
            switch result{
            case .success(let response):
                do{
                    let responseString = try response.mapString()
                    let loginResponse = LoginResponse(JSONString: responseString)
                    if response.statusCode == 200 {
                        handler?(.success(loginResponse!))
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

