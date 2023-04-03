//
//  ContactsViewController.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol ContactsViewProtocol: ContactsViewInstallerProtocol {
    var presenter: ContactsPresenterProtocol? { get set }
}

class ContactsViewController: UIViewController, ContactsViewProtocol {
    var contactsLabel: UILabel!
    
    var presenter: ContactsPresenterProtocol?
    var mainView: UIView { self.view }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        presenter?.viewDidLoad()
    }
}
