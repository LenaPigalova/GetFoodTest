//
//  MenuRouter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol MenuRouterProtocol {
    
    var menuViewController: MenuViewProtocol? { get }
    
    static func start() -> MenuRouterProtocol
}

class MenuRouter: MenuRouterProtocol {
    
    var menuViewController: MenuViewProtocol?
    
    static func start() -> MenuRouterProtocol {
        
        let view: MenuViewProtocol = MenuViewController()
        var interactor: MenuInteractorProtocol = MenuInteractor()
        var presenter: MenuPresenterProtocol = MenuPresenter()
        let router = MenuRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.menuViewController = view
        
        return router
    }
}
