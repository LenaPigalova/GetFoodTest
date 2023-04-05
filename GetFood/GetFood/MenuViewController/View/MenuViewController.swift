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
    func setupTargets()
}

class MenuViewController: UIViewController, MenuViewProtocol {
    
    var headerView: UIView!
    var cityNameLabel: UILabel!
    var cityImage: UIImageView!
    
    var adView: UIView!
    var adHorizontalScrollView: UIScrollView!
    var adImage: UIImageView!
    
    var categoriesView: UIView!
    var categoriesHorizontalScrollView: UIScrollView!
    var pizzaButton: UIButton!
    var comboButton: UIButton!
    var dessertButton: UIButton!
    var drinkButton: UIButton!
    
    var tableView: UITableView!
    
    var tableViewTopAnchorConstreint: NSLayoutConstraint!
    var adViewHeigtConstreint: NSLayoutConstraint!
    var headerViewHeightConstreint: NSLayoutConstraint!
    
    var presenter: MenuPresenterProtocol?
    var mainView: UIView { self.view }
    
    private var selectedCategory = 0
    private var previousContentOffsetY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "headerViewBackground")
        presenter?.viewDidLoad()
        self.tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        buttonSelected(button: pizzaButton)
    }
    
    func setupTargets() {
        pizzaButton.addTarget(self, action: #selector(categoryButtonTaped), for: .touchUpInside)
        comboButton.addTarget(self, action: #selector(categoryButtonTaped), for: .touchUpInside)
        dessertButton.addTarget(self, action: #selector(categoryButtonTaped), for: .touchUpInside)
        drinkButton.addTarget(self, action: #selector(categoryButtonTaped), for: .touchUpInside)
    }
    
    @objc func categoryButtonTaped(button: UIButton) {
        switch selectedCategory {
        case 0:
            buttonUnselected(button: pizzaButton)
        case 1:
            buttonUnselected(button: comboButton)
        case 2:
            buttonUnselected(button: dessertButton)
        case 3:
            buttonUnselected(button: drinkButton)
        default:
            buttonSelected(button: pizzaButton)
        }
        buttonSelected(button: button)
        if button == pizzaButton {
            selectedCategory = 0
        }
        
        if button == comboButton {
            selectedCategory = 1
        }
        
        if button == dessertButton {
            selectedCategory = 2
        }
        
        if button == drinkButton {
            selectedCategory = 3
        }
        tableView.scrollToRow(at: IndexPath(row: 0, section: selectedCategory), at: UITableView.ScrollPosition(rawValue: 0)!, animated: true)
    }
    
    func buttonSelected(button: UIButton) {
        
        button.backgroundColor = UIColor(named: "categoryButtonSelected")
        button.setTitleColor(UIColor(named: "barButtonSelected"), for: .normal)
        guard let text = button.titleLabel?.text else {
            return
        }
        var title = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Bold", size: 13)])
        button.setAttributedTitle(title, for: .normal)
    }
    
    func buttonUnselected(button: UIButton) {
        
        button.backgroundColor = .clear
        button.setTitleColor(UIColor(named: "categoryButton"), for: .normal)
        guard let text = button.titleLabel?.text else {
            return
        }
        var title = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 13)])
        button.setAttributedTitle(title, for: .normal)
    }
}



// MARK: - TabelView DataSourse
extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter!.numberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter!.tableView(tableView, cellForRowAt: indexPath)
    }
    
    
}

// MARK: - TableView Delegate
extension MenuViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentContentOffsetY = scrollView.contentOffset.y
        if currentContentOffsetY > 0 {
            tableViewTopAnchorConstreint.constant = -11
            animateShrinkHeaderView()
        }
        if currentContentOffsetY < -50 {
            tableViewTopAnchorConstreint.constant = 0
            animateZoomHeaderView()
        }
    }
    
    func animateZoomHeaderView(){

        UIView.animate(withDuration: 0.5) {
            self.adViewHeigtConstreint.constant = 112
            self.headerViewHeightConstreint.constant = 296
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShrinkHeaderView(){
        UIView.animate(withDuration: 0.5) {
            self.adViewHeigtConstreint.constant = 0
            self.headerViewHeightConstreint.constant = 184
            self.view.layoutIfNeeded()
        }
    }
    
}
