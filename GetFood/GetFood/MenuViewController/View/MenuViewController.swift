//
//  MenuViewController.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol MenuViewProtocol: MenuViewInstallerProtocol {
    
    var presenter: MenuPresenterProtocol? { get set }
    func setTargets()
}

class MenuViewController: UIViewController, MenuViewProtocol {
    
    var menuLabel: UILabel!
    
    var presenter: MenuPresenterProtocol?
    var mainView: UIView { self.view }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        presenter?.viewDidLoad()
        
    }
    
    func setTargets() {
        
    }
}
