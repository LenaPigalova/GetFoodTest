//
//  CartViewController.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol CartViewProtocol: CartViewInstallerProtocol {
    var presenter: CartPresenterProtocol? { get set }
}

class CartViewController: UIViewController, CartViewProtocol {
    var cartLabel: UILabel!
    
    var presenter: CartPresenterProtocol?
    var mainView: UIView { self.view }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        presenter?.viewDidLoad()
    }
}
