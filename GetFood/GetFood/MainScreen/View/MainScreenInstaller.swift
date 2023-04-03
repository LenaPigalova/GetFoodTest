//
//  MainScreenInstaller.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol MainScreenInstaller: ViewInstaller {
    var tabBar : UITabBarController! {get set}
}

extension MainScreenInstaller {
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func initSubviews() {
        tabBar = UITabBarController()
    }
    
    func embedSubviews() {
        <#code#>
    }
    
    func addSubviewsConstraints() {
        <#code#>
    }
}
