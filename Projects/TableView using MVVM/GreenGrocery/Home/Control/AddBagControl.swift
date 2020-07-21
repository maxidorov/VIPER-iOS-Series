//
//  AddBagControl.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 14.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class AddBagControl: UIView, ViewLoadable {
    
    static var nibName: String = "AddBagControl"
    
    var closure: BagClosure?
    
    var viewModel: AddBagViewModel! {
        didSet {
            let isHidden = viewModel.showStepper
            addButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepLabel.isHidden = !isHidden
            stepLabel.text = "\(viewModel.stepValue)"
        }
    }
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    
    @IBAction func addToBag(_ sender: Any) {
        viewModel = viewModel.onAddToBag()
        closure?(viewModel.stepValue)
    }
    
    @IBAction func incrementButton(_ sender: Any) {
        viewModel = viewModel.onIncrement()
        closure?(viewModel.stepValue)
    }
    
    @IBAction func decrementButton(_ sender: Any) {
        viewModel = viewModel.onDecrement()
        closure?(viewModel.stepValue)
    }
    
    typealias BagClosure = (Int) -> ()
    
    func configure(usingViewModel viewModel: AddBagViewModel, bagClosure: @escaping BagClosure) -> Void {
        self.viewModel = viewModel
        addButton.setTitle(viewModel.title, for: .normal)
        closure = bagClosure
    }
}
