//
//  ProfileViewInstaller.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol ProfileViewInstallerProtocol: ViewInstaller {
    var profileLabel: UILabel! { get set }
}

extension ProfileViewInstallerProtocol {
    
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func initSubviews() {
        profileLabel = UILabel()
        profileLabel.text = "It`s you."
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func embedSubviews() {
        mainView.addSubview(profileLabel)
    }
    
    func addSubviewsConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            profileLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
    }
}
