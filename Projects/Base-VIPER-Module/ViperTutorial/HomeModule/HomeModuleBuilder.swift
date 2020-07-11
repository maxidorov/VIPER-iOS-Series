//
//  HomeModuleBuilder.swift
//  ViperTutorial
//
//  Created by Maxim Sidorov on 21.05.2020.
//  Copyright © 2020 Maxim Sidorov. All rights reserved.
//

import UIKit

class HomeModuleBuilder {
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let interactor = HomeIntercactor()
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
