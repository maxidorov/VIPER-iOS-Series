//
//  HomeRouter.swift
//  ViperTutorial
//
//  Created by Maxim Sidorov on 21.05.2020.
//  Copyright © 2020 Maxim Sidorov. All rights reserved.
//

import UIKit

protocol HomeRouting {
    
}

class HomeRouter {
    var viewController: UIViewController
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension HomeRouter: HomeRouting {
    
}
