//
//  MenuInteractor.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation

protocol MenuInteractorProtocol {
    
    var presenter: MenuPresenterProtocol? { get set }
    
    func fetchGoods() -> [Int : [Goods]]
}

class MenuInteractor: MenuInteractorProtocol {
    
    var presenter: MenuPresenterProtocol?
    
    func fetchGoods() -> [Int : [Goods]] {
        return [0 : [
            Goods(
                id: 0,
                name: "Ветчина и грибы",
                description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                categoriId: 0,
                price: "от 123 р",
                link: ""
            ),
            Goods(
                id: 0,
                name: "Ветчина и грибы",
                description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                categoriId: 0,
                price: "от 123 р",
                link: ""
            ),
            Goods(
                id: 0,
                name: "Ветчина и грибы",
                description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                categoriId: 0,
                price: "от 123 р",
                link: ""
            ),
            Goods(
                id: 0,
                name: "Ветчина и грибы",
                description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                categoriId: 0,
                price: "от 123 р",
                link: ""
            ),
            Goods(
                id: 0,
                name: "Ветчина и грибы",
                description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                categoriId: 0,
                price: "от 123 р",
                link: ""
            )
        ],
                1 : [
                    Goods(
                        id: 1,
                        name: "Супер комбо",
                        description: "Пицца кортошка фри и супер большая кола",
                        categoriId: 1,
                        price: "от 123 р",
                        link: ""
                    ),
                    Goods(
                        id: 1,
                        name: "Супер комбо",
                        description: "Пицца кортошка фри и супер большая кола",
                        categoriId: 1,
                        price: "от 123 р",
                        link: ""
                    ),
                    Goods(
                        id: 1,
                        name: "Супер комбо",
                        description: "Пицца кортошка фри и супер большая кола",
                        categoriId: 1,
                        price: "от 123 р",
                        link: ""
                    ),
                    Goods(
                        id: 1,
                        name: "Супер комбо",
                        description: "Пицца кортошка фри и супер большая кола",
                        categoriId: 1,
                        price: "от 123 р",
                        link: ""
                    ),
                    Goods(
                        id: 1,
                        name: "Супер комбо",
                        description: "Пицца кортошка фри и супер большая кола",
                        categoriId: 1,
                        price: "от 123 р",
                        link: ""
                    )
                    
                ]
        ]
    }
}
