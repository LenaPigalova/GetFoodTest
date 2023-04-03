//
//  MainScreenInstaller.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol MainScreenInstaller: ViewInstaller {
}

extension MainScreenInstaller {
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func initSubviews() {
        
    }
    
    func embedSubviews() {
    }
    
    func addSubviewsConstraints() {
        
    }
}
