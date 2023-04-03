//
//  MainScreanInteractor.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol MainScreenInteractorProtocol {
    
    var presenter: MainScreenPresenterProtocol? { get set }
}

class MainScreenInteractor: MainScreenInteractorProtocol {
    
    var presenter: MainScreenPresenterProtocol?
    
}
