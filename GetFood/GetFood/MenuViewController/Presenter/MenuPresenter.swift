//
//  MenuPresenter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit


protocol MenuPresenterProtocol {
    
    var view: MenuViewProtocol? { get set }
    var interactor: MenuInteractorProtocol? { get set }
    var router: MenuRouterProtocol? { get set }
    
    func viewDidLoad()
    
    func numberOfSections(in tableView: UITableView) -> Int
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

class MenuPresenter: MenuPresenterProtocol {
    
    var view: MenuViewProtocol?
    var interactor: MenuInteractorProtocol?
    var router: MenuRouterProtocol?
    
    var data: [Int : [Goods]] = [0 : []]
    
    func viewDidLoad() {
        view?.setupSubviews()
        view?.setupTargets()
        guard let data1 = interactor?.fetchGoods() else {
            return
        }
        data = data1
    }
    
    }
// MARK: - TableView Data Sourse
extension MenuPresenter {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        let goodsById = data[indexPath.section]!
        let goods = goodsById[indexPath.row]
        cell.priceLabel.layer.cornerRadius = 6
        cell.priceLabel.layer.borderWidth = 1
        cell.priceLabel.layer.borderColor = UIColor(named: "barButtonSelected")!.cgColor
        cell.nameLabel.text = goods.name
        cell.descriptionLabel.text = goods.description
        cell.priceLabel.text = goods.price
        return cell
    }

}
