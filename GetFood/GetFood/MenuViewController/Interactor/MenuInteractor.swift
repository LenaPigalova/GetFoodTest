//
//  MenuInteractor.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import Alamofire

protocol MenuInteractorProtocol {
    
    var presenter: MenuPresenterProtocol? { get set }
    
    func fetchGoods() -> [Int : [Goods]]
    
    func autorization()
}

class MenuInteractor: MenuInteractorProtocol {
    
    var presenter: MenuPresenterProtocol?
    
    var token: String? = nil
    var data: [Int : [Goods]]?
    
    func fetchGoods() -> [Int : [Goods]] {
        if data == nil {
            data = [0 : [
                Goods(
                    id: 0,
                    name: "Ветчина и грибы",
                    description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                    id_category: 0,
                    price: "от 123 р",
                    link: ""
                ),
                Goods(
                    id: 0,
                    name: "Ветчина и грибы",
                    description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                    id_category: 0,
                    price: "от 123 р",
                    link: ""
                ),
                Goods(
                    id: 0,
                    name: "Ветчина и грибы",
                    description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                    id_category: 0,
                    price: "от 123 р",
                    link: ""
                ),
                Goods(
                    id: 0,
                    name: "Ветчина и грибы",
                    description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                    id_category: 0,
                    price: "от 123 р",
                    link: ""
                ),
                Goods(
                    id: 0,
                    name: "Ветчина и грибы",
                    description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                    id_category: 0,
                    price: "от 123 р",
                    link: ""
                )
            ],
                    1 : [
                        Goods(
                            id: 1,
                            name: "Супер комбо",
                            description: "Пицца кортошка фри и супер большая кола",
                            id_category: 1,
                            price: "от 123 р",
                            link: ""
                        ),
                        Goods(
                            id: 1,
                            name: "Супер комбо",
                            description: "Пицца кортошка фри и супер большая кола",
                            id_category: 1,
                            price: "от 123 р",
                            link: ""
                        ),
                        Goods(
                            id: 1,
                            name: "Супер комбо",
                            description: "Пицца кортошка фри и супер большая кола",
                            id_category: 1,
                            price: "от 123 р",
                            link: ""
                        ),
                        Goods(
                            id: 1,
                            name: "Супер комбо",
                            description: "Пицца кортошка фри и супер большая кола",
                            id_category: 1,
                            price: "от 123 р",
                            link: ""
                        ),
                        Goods(
                            id: 1,
                            name: "Супер комбо",
                            description: "Пицца кортошка фри и супер большая кола",
                            id_category: 1,
                            price: "от 123 р",
                            link: ""
                        )
                        
                    ]
            ]
        }
        return data!
    }
    
    func autorization() {
        ApiClient.userLogin { result in
            print(result)
            switch result {
            case .success(let res):
                guard let token = res.token else {
                    Defaults.accessToken = ""
                    return
                }
                Defaults.accessToken = token
                self.getGoods()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getGoods() {
        ApiClient.getGoods(completion: { result in
            switch result {
            case .success(let goodsData):
                self.data = self.getData(goods: goodsData.data)
                print(self.data)
                self.presenter?.reloadData(data: self.data!)
            case .failure(let error):
                print(error)
            }
            
        })

    }
    
    func getData(goods: [Goods]) -> [Int: [Goods]] {
        var data: [Int: [Goods]] = [:]
        let sortedGoods = goods.sorted(by: {$0.id_category<$1.id_category})
        var previousCategoryId = 0
        var goodsByCategory: [Goods] = []
        for item in sortedGoods {
            if(previousCategoryId != item.id_category) {
                data[previousCategoryId] = goodsByCategory
                goodsByCategory = []
                previousCategoryId = item.id_category
            }
            goodsByCategory.append(item)
        }
        print(data)
        data[previousCategoryId] = goodsByCategory
        print(data)
        return data
    }
}
