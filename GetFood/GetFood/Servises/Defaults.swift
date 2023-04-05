//
//  DefoultKeys.swift
//  GetFood
//
//  Created by Пигалова Елена on 05/04/23.
//

import Foundation

struct Defaults {
    
    static let defaults = UserDefaults.standard
    
    static let tokenKey = "ACCESSTOKENKEY"
    
    
    static var accessToken: String {
        set {
            defaults.set(newValue, forKey: Defaults.tokenKey)
        }
        get {
            if let token = defaults.string(forKey: Defaults.tokenKey) {
                return token
            } else  {
                return ""
            }
        }
    }
}
