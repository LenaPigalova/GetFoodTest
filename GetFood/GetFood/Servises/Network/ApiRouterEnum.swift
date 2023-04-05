//
//  ApiRouterEnum.swift
//  GetFood
//
//  Created by Пигалова Елена on 05/04/23.
//

import Foundation
import Alamofire

// "admin@appmaster.io"
// "appmaster"

enum ApiRouterEnum : URLRequestConvertible {
    
    
    case userLogin(username: String, password: String)
    case getGoods
    
    private var path: String {
        switch self {
        case .userLogin:
            return "/auth"
        case .getGoods:
            return "/goods/"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .userLogin:
            return .post
        default:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
            
        case .userLogin(username: _, password: _):
            return ["login" : "admin@appmaster.io", "password" : "appmaster" ]
        case.getGoods:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkHelper().baseURL.asURL()
        
        var urlRequest: URLRequest
        urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(
                HTTPHeaderField.json.rawValue,
                forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(
                HTTPHeaderField.json.rawValue,
                forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
            print("Bearer \(Defaults.accessToken)")
        
        urlRequest.setValue("Bearer \(Defaults.accessToken)", forHTTPHeaderField: "Authorization")

        switch self {
        case .userLogin(username: _, password: _):
            if let parameters = parameters {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        case .getGoods: break
        }
        print(urlRequest)
        print(urlRequest.headers)
        print(urlRequest.method)
        return urlRequest
    }
    
}
