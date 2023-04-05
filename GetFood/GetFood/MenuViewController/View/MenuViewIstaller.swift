//
//  MenuViewIstaller.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

protocol MenuViewInstallerProtocol: ViewInstaller {
    
    var headerView: UIView! { get set }
    var cityNameLabel: UILabel! { get set }
    var cityImage: UIImageView! { get set }
    
    var adView: UIView! { get set }
    var adHorizontalScrollView: UIScrollView! { get set }
    var adImage: UIImageView! { get set }
    
    var categoriesView: UIView! { get set }
    var categoriesHorizontalScrollView: UIScrollView! { get set }
    var pizzaButton: UIButton! { get set }
    var comboButton: UIButton! { get set }
    var dessertButton: UIButton! { get set }
    var drinkButton: UIButton! { get set }
    
    var tableView: UITableView! { get set }
    
    var tableViewTopAnchorConstreint: NSLayoutConstraint! { get set }
    var adViewHeigtConstreint: NSLayoutConstraint! { get set }
    var headerViewHeightConstreint: NSLayoutConstraint! { get set }
}

extension MenuViewInstallerProtocol {
    
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func initSubviews() {
        
        let color: CGColor = CGColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
        
        headerView = UIView()
        headerView.backgroundColor = UIColor(named: "headerViewBackground")
        headerView.layer.shadowColor = CGColor(red: 0.646, green: 0.646, blue: 0.646, alpha: 0.24)
        headerView.layer.shadowOpacity = 1
        headerView.layer.shadowRadius = 14
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        cityNameLabel = UILabel()
        cityNameLabel.font = UIFont(name: "SFUIDisplay-Medium", size: 17)
        cityNameLabel.text = "Москва"
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityImage = UIImageView()
        cityImage.image = UIImage(named: "arrow")
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        
        adView = UIView()
        adView.translatesAutoresizingMaskIntoConstraints = false
        
        adHorizontalScrollView = UIScrollView()
        adHorizontalScrollView.showsVerticalScrollIndicator = false
        adHorizontalScrollView.showsHorizontalScrollIndicator = false
        adHorizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        adImage = UIImageView()
        adImage.image = UIImage(named: "ad1")
        adImage.layer.cornerRadius = 10
        adImage.translatesAutoresizingMaskIntoConstraints = false
        
        categoriesView = UIView()
        categoriesView.translatesAutoresizingMaskIntoConstraints = false
        
        categoriesHorizontalScrollView = UIScrollView()
        categoriesHorizontalScrollView.showsHorizontalScrollIndicator = false
        categoriesHorizontalScrollView.showsVerticalScrollIndicator = false
        categoriesHorizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        pizzaButton = UIButton()
        pizzaButton.layer.cornerRadius = 16
        pizzaButton.layer.borderColor = color
        pizzaButton.layer.borderWidth = 1
        
        pizzaButton.setTitleColor(UIColor(named: "categoryButton"), for: .normal)
        var title = NSAttributedString(string: "Пицца", attributes: [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 13)])
        pizzaButton.setAttributedTitle(title, for: .normal)
        pizzaButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        comboButton = UIButton()
        comboButton.layer.cornerRadius = 16
        comboButton.layer.borderColor = color
        comboButton.layer.borderWidth = 1
        comboButton.setTitleColor(UIColor(named: "categoryButton"), for: .normal)
        title = NSAttributedString(string: "Комбо", attributes: [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 13)])
        comboButton.setAttributedTitle(title, for: .normal)
        comboButton.translatesAutoresizingMaskIntoConstraints = false

        dessertButton = UIButton()
        dessertButton.layer.cornerRadius = 16
        dessertButton.layer.borderColor = color
        dessertButton.layer.borderWidth = 1
        dessertButton.setTitleColor(UIColor(named: "categoryButton"), for: .normal)
        title = NSAttributedString(string: "Десерты", attributes: [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 13)])
        dessertButton.setAttributedTitle(title, for: .normal)
        dessertButton.translatesAutoresizingMaskIntoConstraints = false

        drinkButton = UIButton()
        drinkButton.setTitle("Пицца", for: .normal)
        drinkButton.layer.cornerRadius = 16
        drinkButton.layer.borderColor = color
        drinkButton.layer.borderWidth = 1
        drinkButton.setTitleColor(UIColor(named: "categoryButton"), for: .normal)
        title = NSAttributedString(string: "Напитки", attributes: [NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 13)])
        drinkButton.setAttributedTitle(title, for: .normal)
        drinkButton.translatesAutoresizingMaskIntoConstraints = false
        
        tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 10
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableViewTopAnchorConstreint = tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0)
        
        adViewHeigtConstreint = adView.heightAnchor.constraint(equalToConstant: 112)
        headerViewHeightConstreint = headerView.heightAnchor.constraint(equalToConstant: 296)
        
    }
    
    func embedSubviews() {
        
        adHorizontalScrollView.addSubview(adImage)
        
        adView.addSubview(adHorizontalScrollView)
        
        categoriesHorizontalScrollView.addSubview(pizzaButton)
        categoriesHorizontalScrollView.addSubview(comboButton)
        categoriesHorizontalScrollView.addSubview(dessertButton)
        categoriesHorizontalScrollView.addSubview(drinkButton)
        
        categoriesView.addSubview(categoriesHorizontalScrollView)
        
        headerView.addSubview(cityNameLabel)
        headerView.addSubview(cityImage)
        headerView.addSubview(adView)
        headerView.addSubview(categoriesView)
        
        mainView.addSubview(tableView)
        mainView.addSubview(headerView)
    }
    
    func addSubviewsConstraints() {
        
        // MARK: - CytyLabel Constreints
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 60),
            cityNameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16 ),
            cityNameLabel.widthAnchor.constraint(equalToConstant: 61),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 67),
            cityImage.leadingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor, constant: 8),
            cityImage.widthAnchor.constraint(equalToConstant: 14),
            cityImage.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        // MARK: - AdView Consreints
        NSLayoutConstraint.activate([
            adView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 24),
            adView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            adView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            adViewHeigtConstreint
        ])
        
        NSLayoutConstraint.activate([
            adHorizontalScrollView.topAnchor.constraint(equalTo: adView.topAnchor),
            adHorizontalScrollView.leadingAnchor.constraint(equalTo: adView.leadingAnchor),
            adHorizontalScrollView.trailingAnchor.constraint(equalTo: adView.trailingAnchor),
            adHorizontalScrollView.bottomAnchor.constraint(equalTo: adView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            adImage.topAnchor.constraint(equalTo: adView.topAnchor),
            adImage.leadingAnchor.constraint(equalTo: adView.leadingAnchor, constant: 16),
            adImage.widthAnchor.constraint(equalToConstant: 300),
            adImage.heightAnchor.constraint(equalToConstant: 112)
        ])
        // MARK: - CategoriesView Constreints
        
        NSLayoutConstraint.activate([
            categoriesView.topAnchor.constraint(equalTo: adView.bottomAnchor, constant: 24),
            categoriesView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            categoriesView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            categoriesView.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            categoriesHorizontalScrollView.topAnchor.constraint(equalTo: categoriesView.topAnchor),
            categoriesHorizontalScrollView.leadingAnchor.constraint(equalTo: categoriesView.leadingAnchor),
            categoriesHorizontalScrollView.trailingAnchor.constraint(equalTo: categoriesView.trailingAnchor),
            categoriesHorizontalScrollView.bottomAnchor.constraint(equalTo: categoriesView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pizzaButton.topAnchor.constraint(equalTo: categoriesView.topAnchor),
            pizzaButton.leadingAnchor.constraint(equalTo: categoriesView.leadingAnchor, constant: 16),
            pizzaButton.widthAnchor.constraint(equalToConstant: 88),
            pizzaButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            comboButton.topAnchor.constraint(equalTo: categoriesView.topAnchor),
            comboButton.leadingAnchor.constraint(equalTo: pizzaButton.trailingAnchor, constant: 8),
            comboButton.widthAnchor.constraint(equalToConstant: 88),
            comboButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            dessertButton.topAnchor.constraint(equalTo: categoriesView.topAnchor),
            dessertButton.leadingAnchor.constraint(equalTo: comboButton.trailingAnchor, constant: 8),
            dessertButton.widthAnchor.constraint(equalToConstant: 88),
            dessertButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            drinkButton.topAnchor.constraint(equalTo: categoriesView.topAnchor),
            drinkButton.leadingAnchor.constraint(equalTo: dessertButton.trailingAnchor, constant: 8),
            drinkButton.widthAnchor.constraint(equalToConstant: 88),
            drinkButton.heightAnchor.constraint(equalToConstant: 32)
        ])

        
        // MARK: - Header & TableView Constreints
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: mainView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            headerViewHeightConstreint
        ])
        
        NSLayoutConstraint.activate([
            tableViewTopAnchorConstreint,
            tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
        
    }
}
