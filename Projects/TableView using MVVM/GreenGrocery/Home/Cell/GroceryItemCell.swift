//
//  GroceryItemCell.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 21.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class GroceryItemCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel! {
        didSet {
            detailsLabel.textColor = .lightGray
        }
    }
    
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(usingViewModel viewModel: GroceryItemViewModel) {
        
        self.productImageView.backgroundColor = UIColor.init(
            red: CGFloat(arc4random_uniform(255)) / 255.0,
            green: CGFloat(arc4random_uniform(255)) / 255.0,
            blue: CGFloat(arc4random_uniform(255)) / 255.0,
            alpha: 1
        )
        
        self.titleLabel.text = viewModel.title
        self.detailsLabel.text = viewModel.details
        self.priceLabel.text = viewModel.price
    }
}
