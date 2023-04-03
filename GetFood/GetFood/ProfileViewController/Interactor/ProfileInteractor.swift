//
//  ProfileInteractor.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol ProfileInteractorProtocol {
    var presenter: ProfilePresenterProtocol? { get set }
}

class ProfileInteractor: ProfileInteractorProtocol {
    
    var presenter: ProfilePresenterProtocol?
}
