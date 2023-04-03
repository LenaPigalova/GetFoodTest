//
//  ContactsPresenter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol ContactsPresenterProtocol {
    
    var view: ContactsViewProtocol? { get set }
    var interactor: ContactsInteractorProtocol? { get set }
    var router: ContactsRouterProtocol? { get set }
    
    func viewDidLoad()
}

class ContactsPresenter: ContactsPresenterProtocol {
    
    var view: ContactsViewProtocol?
    var interactor: ContactsInteractorProtocol?
    var router: ContactsRouterProtocol?
    
    func viewDidLoad() {
        view?.setupSubviews()
    }
}
