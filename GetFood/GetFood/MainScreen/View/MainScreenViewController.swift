//
//  MainScreenViewController.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol MainScreenViewProtocol: MainScreenInstaller {
    var presenter: MainScreenPresenterProtocol? { get set }
    func setupTargets()
}

class MainScreenViewController: UITabBarController, MainScreenViewProtocol {
    
    var presenter: MainScreenPresenterProtocol?
    
    var mainView: UIView { self.view }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = UIColor(named: "barButtonUnselected")
        
        tabBar.tintColor = UIColor(named: "barButtonSelected")
        self.modalPresentationStyle = .fullScreen
        presenter?.viewDidLoad()
        
    }
    
    func setupTargets() {
    }
}
