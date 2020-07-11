//
//  ViewController.swift
//  VIPER Basic slider
//
//  Created by Maxim Sidorov on 11.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol OnColorValueDelegate {
    func onColorValueChange() -> ()
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var rgbValueLabel: UILabel!
    
    var presenter: HomeViewPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCurrentColor()
    }
    
    @IBAction func onRedValuerChanged(_ sender: UISlider) {
        print("Red value received: \(sender.value)")
        onColorValueChange()
    }
    
    @IBAction func onGreenValueChanged(_ sender: UISlider) {
        print("Green value received: \(sender.value)")
        onColorValueChange()
    }
    
    @IBAction func onBlueValueChanged(_ sender: UISlider) {
        print("Blue value received: \(sender.value)")
        onColorValueChange()
    }
    
    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> (Void) {
        print("Current colors are saved!")
        presenter?.onColorValueChange(rgb: rgb)
    }
    
    func loadCurrentColor() -> () {
        print("View controller delegating loadCurrentColor to presenter")
        presenter?.onLoadCurrentColor()
    }
}

extension HomeViewController: HomeView {
    
    func loadCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) {
        
        sliderRed.value = Float(rgb.0)
        sliderGreen.value = Float(rgb.1)
        sliderBlue.value = Float(rgb.2)
        
        rgbValueLabel.text = "RGB (\(rgb.0), \(rgb.1), \(rgb.2))"
        self.view.backgroundColor = UIColor(
            red: rgb.0 / 255,
            green: rgb.1 / 255,
            blue: rgb.2 / 255, alpha: 1.0
        )
    }
}

extension HomeViewController: OnColorValueDelegate {
    
    func onColorValueChange() {
        
        let step: Float = 1
        
        let red = CGFloat(round(sliderRed.value / step) * step)
        let green = CGFloat(round(sliderGreen.value / step) * step)
        let blue = CGFloat(round(sliderBlue.value / step) * step)
        
        rgbValueLabel.text = "RGB (\(red), \(green), \(blue))"
        
        self.view.backgroundColor = UIColor(
            red: red / 255,
            green: green / 255,
            blue: blue / 255, alpha: 1.0
        )
        
        saveCurrentColor(rgb: (red, green, blue))
    }
}
