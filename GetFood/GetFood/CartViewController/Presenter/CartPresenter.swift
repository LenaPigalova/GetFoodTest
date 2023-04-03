//
//  CartViewPresenter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol CartPresenterProtocol {
    
    var view: CartViewProtocol? { get set }
    var interactor: CartInteractorProtocol? { get set }
    var router: CartRouterProtocol? { get set }
    
    func viewDidLoad()
}

class CartPresenter: CartPresenterProtocol {
    
    var view: CartViewProtocol?
    var interactor: CartInteractorProtocol?
    var router: CartRouterProtocol?
    
    func viewDidLoad() {
        view?.setupSubviews()
    }
}
