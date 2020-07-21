//
//  HomeModuleBuilder.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 21.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class HomeModuleBuilder {
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let router = HomeRouter(view: view)
        let interactor = HomeInteractor(service: StubService.shared)
        view.presenter = HomePresenter(view: view, router: router, interactor: interactor)
        return view
    }
}
