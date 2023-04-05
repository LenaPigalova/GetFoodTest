//
//  ApiClient.swift
//  GetFood
//
//  Created by Пигалова Елена on 05/04/23.
//

import Foundation
import Alamofire

class ApiClient {
    @discardableResult
    private static func performRequest<T:Decodable>(
        route: ApiRouterEnum,
        decoder: JSONDecoder = JSONDecoder(),
        completion:@escaping (Result<T, AFError>) -> Void
    ) -> DataRequest {
        return AF.request(route)
//            .response(completionHandler: {
//                result in
//                print(String(decoding: result.data!, as: UTF8.self))
//            })
            .responseDecodable (decoder: decoder) {
                (response: DataResponse<T, AFError>) in
                print(response)
                completion(response.result)
               }
    }
    
    @discardableResult
    private static func performRequestMultipart<T:Decodable>(
        images: [Data],
        route: ApiRouterEnum,
        decoder: JSONDecoder = JSONDecoder(),
        completion:@escaping (Result<T, AFError>) -> Void
    ) -> DataRequest {
        
        let req = AF.upload(multipartFormData: { formData in
            var counter = 1
            for image in images {
                formData.append(image, withName: "images[]", fileName: "file\(counter).jpeg", mimeType: "image/jpeg")
                counter += 1
            }
            for (key, value) in route.parameters! {
                formData.append((value as! String).data(using: .utf8)!, withName: key)
            }
        }, with: route)
//        .response(completionHandler: { responseData in
//            print(String(decoding: responseData.data!, as: UTF8.self))
//        })
        .responseDecodable(decoder: decoder) {
            (response: DataResponse<T, AFError>) in
            completion(response.result)
        }
        return req
    }
    
    
    static func userLogin(
        completion: @escaping (Result<AuthorizationResponse, AFError>)->Void
                          
    ) {
        performRequest(route: ApiRouterEnum.userLogin(username: "admin@appmaster.io", password: "appmaster"), completion: completion)
    }
    
    static func getGoods(
        completion: @escaping (Result<GoodsData, AFError>)->Void
    ) {
        performRequest(route: ApiRouterEnum.getGoods, completion: completion)
    }
}
