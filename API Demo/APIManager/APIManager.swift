//
//  APIManager.swift
//  API Demo
//
//  Created by Sikandar Ali on 25/08/2021.
//

import Foundation
import Alamofire
enum APIError:Error {
    case custom(massege:String)
}
  
typealias Handler = (Swift.Result<Any?,APIError>) -> Void
class APIManager {
    static let shared = APIManager()
    
    
    func callingRegisterAPI(register:RegisterModel,completionaHandler: @escaping (Bool)->()){
        let headers : HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do{
                    let jsondata = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200{
                        completionaHandler(true)
                    }else{
                        completionaHandler(false)
                    }
                    print(jsondata)
                } catch{     print(error.localizedDescription)
                    completionaHandler(false)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionaHandler(false)   
                 
            }
        }
        
        
    }
    
    func callingLoginAPI(login:LoginModel,completion: @escaping Handler){
        let headers : HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do{
                    let jsondata = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200{
                        completion(.success(jsondata))
                    }else{
                        completion(.failure(.custom(massege: "Please Check your connetion")))
                    }
                    print(jsondata)
                } catch{     print(error.localizedDescription)
                    completion(.failure(.custom(massege: "Please Check your connetion")))
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(.failure(.custom(massege: "Please Check your connetion")))
                 
            }
        }
    }
}
