//
//  MenuPresenter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation


protocol MenuPresenterProtocol {
    
    var view: MenuViewProtocol? { get set }
    var interactor: MenuInteractorProtocol? { get set }
    var router: MenuRouterProtocol? { get set }
    
    func viewDidLoad()
}

class MenuPresenter: MenuPresenterProtocol {
    
    var view: MenuViewProtocol?
    var interactor: MenuInteractorProtocol?
    var router: MenuRouterProtocol?
    
    func viewDidLoad() {
        view?.setupSubviews()
        view?.setupTargets()
    }
}
