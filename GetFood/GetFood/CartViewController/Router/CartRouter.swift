//
//  CartRouter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol CartRouterProtocol {
    
    var viewController: CartViewProtocol? { get set }
    
    static func start() -> CartRouterProtocol
}

class CartRouter: CartRouterProtocol {
    
    var viewController: CartViewProtocol?
    
    static func start() -> CartRouterProtocol {
        let view: CartViewProtocol = CartViewController()
        var interactor: CartInteractorProtocol = CartInteractor()
        var presenter: CartPresenterProtocol = CartPresenter()
        var router: CartRouterProtocol = CartRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.viewController = view
        
        return router
    }
}
