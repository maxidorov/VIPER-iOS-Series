//
//  HomeRouter.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 21.07.2020.
//  Copyright © 2020 MS. All rights reserved.
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
