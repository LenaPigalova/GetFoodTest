//
//  MenuInteractor.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol MenuInteractorProtocol {
    
    var presenter: MenuPresenterProtocol? { get set }
}

class MenuInteractor: MenuInteractorProtocol {
    
    var presenter: MenuPresenterProtocol?
}
