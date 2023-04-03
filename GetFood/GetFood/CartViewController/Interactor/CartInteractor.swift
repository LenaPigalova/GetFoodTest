//
//  CartViewInteractor.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol CartInteractorProtocol {
    var presenter: CartPresenterProtocol? { get set }
}

class CartInteractor: CartInteractorProtocol {
    
    var presenter: CartPresenterProtocol?
}
