//
//  ProfileRouter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol ProfileRouterProtocol {
    
    var viewController: ProfileViewProtocol? { get set }
    
    static func start() -> ProfileRouterProtocol
}

class ProfileRouter: ProfileRouterProtocol {
    
    var viewController: ProfileViewProtocol?
    
    static func start() -> ProfileRouterProtocol {
        let view: ProfileViewProtocol = ProfileViewController()
        var interactor: ProfileInteractorProtocol = ProfileInteractor()
        var presenter: ProfilePresenterProtocol = ProfilePresenter()
        var router: ProfileRouterProtocol = ProfileRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.viewController = view
        
        return router
    }
}
