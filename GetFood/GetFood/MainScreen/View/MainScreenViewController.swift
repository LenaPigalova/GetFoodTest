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
        let color = CGColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = color
        tabBar.tintColor = UIColor(named: "barButtonSelected")
        self.modalPresentationStyle = .fullScreen
        presenter?.viewDidLoad()
        
    }
    
    func setupTargets() {
    }
}
