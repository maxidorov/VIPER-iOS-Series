//
//  GroceryResult.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 21.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

struct GroceryResult: Codable {
    let groceries: [Grocery]
}

struct Grocery: Codable {
    let skuId: String
    let title: String
    let image: String
    let details: String
    let price: Double
    
    private enum CodingKeys: String, CodingKey {
        case skuId = "sku-id"
        case title
        case image = "product_image"
        case details
        case price
    }
}
