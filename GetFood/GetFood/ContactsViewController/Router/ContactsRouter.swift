//
//  ContactsRouter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol ContactsRouterProtocol {
    
    var viewController: ContactsViewProtocol? { get set }
    
    static func start() -> ContactsRouterProtocol
}

class ContactsRouter: ContactsRouterProtocol {
    
    var viewController: ContactsViewProtocol?
    
    static func start() -> ContactsRouterProtocol {
        let view: ContactsViewProtocol = ContactsViewController()
        var interactor: ContactsInteractorProtocol = ContactsInteractor()
        var presenter: ContactsPresenterProtocol = ContactsPresenter()
        var router: ContactsRouterProtocol = ContactsRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.viewController = view
        
        return router
    }
}


