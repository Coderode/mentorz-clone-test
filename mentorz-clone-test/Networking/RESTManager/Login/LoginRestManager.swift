import UIKit
import Moya

class LoginRestManager {
    static func validateUser(loginObject: LoginRequest, handler: ((Result<LoginResponse, APIHitError>) -> Void)?){
        let provider = MoyaProvider<UserAccount>()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // api hit over moya
            // moya will provide you the response
            // store that response in a vaiable
            // pass that variable as success object
            provider.request(.login(loginDetail: loginObject)) { (result) in
                switch result{
                case .success(let response):
                    do{
                        let jsonDecoder = JSONDecoder()
                        let loginResponse = try jsonDecoder.decode(LoginResponse.self, from: response.data)
                        //print(loginResponse.name)
                        //print(try response.mapJSON())
                        //print(response.statusCode)
                        if response.statusCode == 200 {
                            handler?(.success(loginResponse))
                        }
                    }catch let parsingError{
                        print("ERROR!")
                        print(parsingError.localizedDescription)
                        print(response.statusCode)
                        let error =  APIHitError(parsingError.localizedDescription,response.statusCode)
                        handler?(.failure(error))
                    }
                case .failure(let moyaError):
                    let error =  APIHitError(moyaError.errorDescription!,moyaError.errorCode)
                    print("Failed")
                    //print(moyaError.errorCode)
                    //print(moyaError.errorUserInfo)
                    //print(moyaError.errorDescription!)
                    handler?(.failure(error))
                    
                }
            }
            
        }
    }
}
