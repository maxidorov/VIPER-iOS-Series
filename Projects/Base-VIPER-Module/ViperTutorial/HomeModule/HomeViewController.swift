//
//  ViewController.swift
//  ViperTutorial
//
//  Created by Maxim Sidorov on 21.05.2020.
//  Copyright © 2020 Maxim Sidorov. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func updateTitle(title: String)
}

class HomeViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    var presenter: HomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewDidLoad()
    }
}

extension HomeViewController: HomeView {
    
    func updateTitle(title: String) {
        helloLabel.text = "Hello VIPER"
    }
}
