//
//  ProfilePresenter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol ProfilePresenterProtocol {
    
    var view: ProfileViewProtocol? { get set }
    var interactor: ProfileInteractorProtocol? { get set }
    var router: ProfileRouterProtocol? { get set }
    
    func viewDidLoad()
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    var view: ProfileViewProtocol?
    var interactor: ProfileInteractorProtocol?
    var router: ProfileRouterProtocol?
    
    func viewDidLoad() {
        view?.setupSubviews()
    }
}
