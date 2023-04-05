//
//  NetworkHelper.swift
//  GetFood
//
//  Created by Пигалова Елена on 05/04/23.
//

import Foundation

struct NetworkHelper {
    let baseURL = "https://alpuldc-app.apms.io/api"
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case json = "application/json"
    case urlrncoder = "application/x-www-form-urlencoded"
    case encodingType = "gzip, deflate, br"
    case acceptLangiage = "Accept-Language"
}
