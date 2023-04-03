//
//  ContactsViewInastaller.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol ContactsViewInstallerProtocol: ViewInstaller {
    
    var contactsLabel: UILabel! { get set }
}

extension ContactsViewInstallerProtocol {
    
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func initSubviews() {
        contactsLabel = UILabel()
        contactsLabel.text = "You can call or write to us."
        contactsLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func embedSubviews() {
        mainView.addSubview(contactsLabel)
    }
    
    func addSubviewsConstraints() {
        NSLayoutConstraint.activate([
            contactsLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            contactsLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
    }
}
