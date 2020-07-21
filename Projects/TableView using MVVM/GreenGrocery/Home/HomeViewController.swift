//
//  HomeViewController.swift
//  Stepper Control MVVM
//
//  Created by Maxim Sidorov on 14.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func updateGroceries(groceriesList: [GroceryItemViewModel])
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresentation?
    
    @IBOutlet weak var tableView: UITableView!
    
    private static let groceryCellID = "groceryCellID"
    
    var dataSource: [GroceryItemViewModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var addBagControl: AddBagControl = {
        let control = AddBagControl.loadFromNib()
        let viewModel = AddBagViewModel(
            title: "ADD TO BAG",
            stepValue: 0)
        control.configure(usingViewModel: viewModel, bagClosure: { (stepValue: Int) in
                print("Current step value: \(stepValue)")
        })
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
        self.tableView.register(UINib(nibName: "GroceryItemCell", bundle: nil), forCellReuseIdentifier: HomeViewController.groceryCellID)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}

extension HomeViewController: HomeView {
    
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        print("Grocery list: \(groceriesList)")
        self.dataSource = groceriesList
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.groceryCellID, for: indexPath) as! GroceryItemCell
        cell.configure(usingViewModel: viewModel)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
}
