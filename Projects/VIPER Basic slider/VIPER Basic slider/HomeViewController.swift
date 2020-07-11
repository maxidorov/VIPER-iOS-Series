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
    @IBOutlet weak var rgbValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rgb = loadCurrentColor()
        
        sliderRed.value = Float(rgb.0)
        sliderGreen.value = Float(rgb.1)
        sliderBlue.value = Float(rgb.2)
        rgbValue.text = "RGB (\(rgb.0), \(rgb.1), \(rgb.2))"
        self.view.backgroundColor = UIColor(
            red: rgb.0 / 255,
            green: rgb.1 / 255,
            blue: rgb.2 / 255, alpha: 1.0
        )
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
        UserDefaults.standard.set(rgb.0, forKey: "Red")
        UserDefaults.standard.set(rgb.1, forKey: "Green")
        UserDefaults.standard.set(rgb.2, forKey: "Blue")
        print("Current colors are saved")
    }
    
    func loadCurrentColor() -> (CGFloat, CGFloat, CGFloat) {
        let red = CGFloat(UserDefaults.standard.float(forKey: "Red"))
        let green = CGFloat(UserDefaults.standard.float(forKey: "Green"))
        let blue = CGFloat(UserDefaults.standard.float(forKey: "Blue"))
        
        return (red, green, blue)
    }
}

extension HomeViewController: OnColorValueDelegate {
    func onColorValueChange() {
        
        let step: Float = 1
        
        let red = CGFloat(round(sliderRed.value / step) * step)
        let green = CGFloat(round(sliderGreen.value / step) * step)
        let blue = CGFloat(round(sliderBlue.value / step) * step)
        
        rgbValue.text = "RGB (\(red), \(green), \(blue))"
        
        self.view.backgroundColor = UIColor(
            red: red / 255,
            green: green / 255,
            blue: blue / 255, alpha: 1.0
        )
        
        saveCurrentColor(rgb: (red, green, blue))
    }
}
