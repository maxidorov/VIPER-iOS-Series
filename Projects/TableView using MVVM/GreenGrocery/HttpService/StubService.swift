//
//  StubService.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 21.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

typealias GroceriesClosure = (GroceryResult) -> (Void)
protocol GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure) -> (Void)
}

class StubService {
    static let shared: StubService = StubService()
    private init() { }
}

extension StubService: GroceriesAPI {
    
    func fetchGroceries(completion: GroceriesClosure) {
        
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(GroceryResult.self, from: data)
                completion(groceryResult)
            } catch {
                print("Something went wrong with error = \(error)")
            }
        }
    }
}
