//
//  HomeViewController.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 14.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var containerStackView: UIStackView!
    
    lazy var addBagControl: AddBagControl = {
        let control = AddBagControl.loadFromNib()
        let viewModel = AddBagViewModel(
            title: "ADD TO BAG",
            stepValue: 0)
        control.configure(
            usingViewModel:
            viewModel,
            bagClosure: {
                (stepValue: Int) in
                print("Current step value: \(stepValue)")
        })
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.containerStackView.addArrangedSubview(addBagControl)
    }
    
}
