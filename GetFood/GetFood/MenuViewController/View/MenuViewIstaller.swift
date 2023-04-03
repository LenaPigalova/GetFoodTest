//
//  MenuViewIstaller.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol MenuViewInstallerProtocol: ViewInstaller {
    var menuLabel: UILabel! { get set }
}

extension MenuViewInstallerProtocol {
    
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func initSubviews() {
        menuLabel = UILabel()
        menuLabel.text = "Hellow, it`s work!"
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func embedSubviews() {
        mainView.addSubview(menuLabel)
    }
    
    func addSubviewsConstraints() {
        NSLayoutConstraint.activate([
            menuLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            menuLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        ])
        
    }
}
