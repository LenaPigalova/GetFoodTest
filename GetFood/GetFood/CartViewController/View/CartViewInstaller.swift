//
//  CartViewInstaller.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol CartViewInstallerProtocol: ViewInstaller {
    var cartLabel: UILabel! { get set }
}

extension CartViewInstallerProtocol {
    
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func initSubviews() {
        
        cartLabel = UILabel()
        cartLabel.text = "You have to order something."
        cartLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func embedSubviews() {
        mainView.addSubview(cartLabel)
    }
    
    func addSubviewsConstraints() {
        NSLayoutConstraint.activate([
            cartLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            cartLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
    }
}
