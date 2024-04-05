//
//  ViewController.swift
//  HomeWork.2.04
//
//  Created by Alexander Shevtsov on 20.03.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var colorsView: UIView!
    
    @IBOutlet private var redLabel: UILabel!
    @IBOutlet private var greenLabel: UILabel!
    @IBOutlet private var blueLabel: UILabel!
    
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorsView.layer.cornerRadius = 20 // скругление
        setColor()
        
        // получить String из слайдеров
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    @IBAction private func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }
    
    // начальное значение для цвета
    private func setColor() {
        colorsView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
    
    // приводим Double из слайдеров к String методом DateFormatter
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// расширяем тип Float
extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self) // self значит что мы инициализируем самим типом Float
    }
}
