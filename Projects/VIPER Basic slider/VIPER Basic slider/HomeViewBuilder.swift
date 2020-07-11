//
//  HomeViewBuilder.swift
//  VIPER Basic slider
//
//  Created by Maxim Sidorov on 11.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

// Representation of HomeViewController()
protocol HomeView: class {
    func loadCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> (Void)
}

protocol HomeUseCase: class {
    func loadCurrentColor() -> (CGFloat, CGFloat, CGFloat)
    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> ()
}

class HomeInteractor: HomeUseCase {
    
    let appColorDao: AppColorDao?
    
    init(dao: AppColorDao = AppColorDao()) {
        appColorDao = dao
    }
    
    func loadCurrentColor() -> (CGFloat, CGFloat, CGFloat) {
        let currentRgb = appColorDao?.fetch()
        return currentRgb!
    }
    
    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> (Void) {
        appColorDao?.save(rgb: rgb)
    }
}

protocol HomeViewWireframe: class {
    var viewController: UIViewController? { get }
}

class HomeViewRouter: HomeViewWireframe {
    var viewController: UIViewController?
}

protocol HomeViewPresentation: class {
    var view: HomeView? { get }
    var router: HomeViewWireframe? { get }
    var interactor: HomeUseCase? { get }
    
    func onLoadCurrentColor() -> ()
    func onColorValueChange(rgb: (CGFloat, CGFloat, CGFloat)) -> ()
}

class HomeViewPresenter: HomeViewPresentation {
    weak var view: HomeView?
    var router: HomeViewWireframe?
    var interactor: HomeUseCase?
    
    func onLoadCurrentColor() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            guard let `self` = self else { return }
            
            let currentRgb = self.interactor?.loadCurrentColor()
            
            DispatchQueue.main.async {
                self.view?.loadCurrentColor(rgb: currentRgb!)
            }
        }
    }
    
    func onColorValueChange(rgb: (CGFloat, CGFloat, CGFloat)) {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            guard let `self` = self else { return }
            
            self.interactor?.saveCurrentColor(rgb: rgb)
        }
    }
}

class HomeViewBuilder {

    static func assembleModule() -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController
        let presenter = HomeViewPresenter()
        let interactor = HomeInteractor()
        let router = HomeViewRouter()
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.viewController = view
        
        return view
    }
}
