//
//  HomeInteractor.swift
//  ViperTutorial
//
//  Created by Maxim Sidorov on 21.05.2020.
//  Copyright © 2020 Maxim Sidorov. All rights reserved.
//

protocol HomeUseCase {
    func getTitle() -> HomeModel
}

class HomeIntercactor { }

extension HomeIntercactor: HomeUseCase {
    
    func getTitle() -> HomeModel {
        return HomeModel(title: "Home VIPER")
    }
}
