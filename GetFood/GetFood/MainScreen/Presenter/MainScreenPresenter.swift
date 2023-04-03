//
//  MainScreenPresenter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol MainScreenPresenterProtocol {
    
    var view: MainScreenViewProtocol? { get set }
    var interactor: MainScreenInteractorProtocol? { get set }
    var router: MainScreenRouterProtocol? { get set }
    
    func viewDidLoad()
}

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    var view: MainScreenViewProtocol?
    var interactor: MainScreenInteractorProtocol?
    var router: MainScreenRouterProtocol?
    
    func viewDidLoad() {
        view?.setupSubviews()
        view?.setupTargets()
    }
    
}
