//
//  ProfileViewController.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol ProfileViewProtocol: ProfileViewInstallerProtocol {
    var presenter: ProfilePresenterProtocol? { get set }
}

class ProfileViewController: UIViewController, ProfileViewProtocol {
    var profileLabel: UILabel!
    
    var presenter: ProfilePresenterProtocol?
    var mainView: UIView { self.view }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        presenter?.viewDidLoad()
    }
}
