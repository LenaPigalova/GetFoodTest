//
//  ContactsInteractor.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol ContactsInteractorProtocol {
    var presenter: ContactsPresenterProtocol? { get set }
}

class ContactsInteractor: ContactsInteractorProtocol {
    
    var presenter: ContactsPresenterProtocol?
}
