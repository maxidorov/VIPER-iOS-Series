//
//  HomeInteractor.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 21.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

protocol HomeUseCase {
    func getGroceries(completion: GroceriesClosure)
}

class HomeInteractor: HomeUseCase {
    var service: GroceriesAPI
    init(service: GroceriesAPI) {
        self.service = service
    }
}

extension HomeInteractor {
    
    func getGroceries(completion: GroceriesClosure) {
        
        self.service.fetchGroceries { (result) in
            completion(result)
        }
    }
}
