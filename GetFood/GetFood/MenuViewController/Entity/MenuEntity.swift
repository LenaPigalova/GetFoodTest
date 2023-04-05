//
//  MenuEntity.swift
//  GetFood
//
//  Created by Пигалова Елена on 04/04/23.
//

import Foundation

struct Goods: Decodable {
    let id: Int
    let name: String
    let description: String
    let id_category: Int
    let price: String
    let link: String
}

struct GoodsData: Decodable {
    let data : [Goods]
}
