//
//  ViewController.swift
//  BMI HomeWork
//
//  Created by LinhMAC on 23/07/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var maleButton: UIImageView!
    @IBOutlet weak var maleLabel: UILabel!
    @IBOutlet weak var MaleText: UITextField!
    @IBOutlet weak var femaleImage: UIImageView!
    @IBOutlet weak var femaleText: UITextField!
    @IBOutlet weak var femaleTheme: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var HeightTheme: UILabel!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightTheme: UILabel!
    @IBOutlet weak var weightStepper: UIStepper!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var caculateButton: UIButton!
    @IBOutlet weak var ageTheme: UILabel!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var ageStepper: UIStepper!
    
    private let heightValueLabel = UILabel()
    private var isMaleSelected = false
    //    private func calculateBMI() -> Double {
    //        let heightInMeters = Double(heightSlider.value) / 100
    //        let weightInKg = Double(weightStepper.value)
    //        return weightInKg / (heightInMeters * heightInMeters)
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.10, green: 0.12, blue: 0.20, alpha: 1.00)
        //maleButton
        maleLabel.backgroundColor = UIColor(red: 0.22, green: 0.20, blue: 0.27, alpha: 1.00)
        maleLabel.frame = CGRect(x: 20,
                                 y: 100,
                                 width: 180,
                                 height: 200)
        maleLabel.text = ""
        maleLabel.layer.cornerRadius = 5
        maleLabel.clipsToBounds = true
        maleButton.frame = CGRect(x: 20,
                                  y: 100,
                                  width: 50,
                                  height: 50)
        maleButton.center = maleLabel.center
        MaleText.text = "MALE"
        MaleText.textColor = .gray
        MaleText.textAlignment = .center
        MaleText.center.x = maleButton.center.x
        MaleText.center.y = maleButton.center.y + 50
        MaleText.backgroundColor = maleLabel.backgroundColor
        MaleText.font = UIFont(name: "", size: 27)
        //Female button
        femaleTheme.backgroundColor = UIColor(red: 0.22, green: 0.20, blue: 0.27, alpha: 1.00)
        femaleTheme.frame = CGRect(x: maleLabel.frame.maxX+20,
                                   y: maleLabel.frame.minY,
                                   width: maleLabel.frame.width,
                                   height: maleLabel.frame.height)
        femaleTheme.text = ""
        femaleTheme.layer.cornerRadius = 5
        femaleTheme.clipsToBounds = true
        femaleImage.frame = CGRect(x: 20,
                                   y: 100,
                                   width: 50,
                                   height: 50)
        
        femaleImage.center = femaleTheme.center
        femaleText.text = "FEMALE"
        femaleText.textColor = .gray
        femaleText.textAlignment = .center
        femaleText.center.x = femaleImage.center.x
        femaleText.center.y = femaleImage.center.y + 50
        femaleText.backgroundColor = femaleTheme.backgroundColor
        femaleText.font = UIFont(name: "", size: 27)
        //Height
        HeightTheme.backgroundColor = UIColor(red: 0.22, green: 0.20, blue: 0.27, alpha: 1.00)
        HeightTheme.frame = CGRect(x: maleLabel.frame.minX,
                                   y: maleLabel.frame.maxY+20,
                                   width: femaleTheme.frame.maxX - maleLabel.frame.minX,
                                   height: maleLabel.frame.height)
        HeightTheme.layer.cornerRadius = 5
        HeightTheme.clipsToBounds = true
        HeightTheme.text = ""
        
        heightSlider.frame = CGRect(x: HeightTheme.frame.minX+20,
                                    y: HeightTheme.frame.maxY-50,
                                    width: HeightTheme.frame.width-60,
                                    height: 30)
        heightSlider.center.x = HeightTheme.center.x
        heightSlider.maximumValue = 250
        heightSlider.minimumValue = 50
        //text
        heightText.text = "HEIGHT"
        heightText.textColor = .gray
        heightText.textAlignment = .center
        heightText.center.x = HeightTheme.center.x
        heightText.center.y = HeightTheme.frame.minY+30
        heightText.backgroundColor = HeightTheme.backgroundColor
        heightText.font = UIFont(name: "", size: 27)
        //them label update gia tri slider
        heightValueLabel.frame = CGRect(x: HeightTheme.frame.minX+20,
                                        y: 20,
                                        width: heightSlider.frame.width,
                                        height: 50)
        heightValueLabel.center.y = HeightTheme.center.y
        heightValueLabel.textAlignment = .center
        heightValueLabel.textColor = .white
        heightValueLabel.font = UIFont.systemFont(ofSize: 20)
        heightValueLabel.text = "\(Int(heightSlider.value))cm"
        view.addSubview(heightValueLabel)
        
        heightSlider.addTarget(self, action: #selector(heightSliderValueChanged), for: .valueChanged)
        //weight
        weightTheme.backgroundColor = UIColor(red: 0.22, green: 0.20, blue: 0.27, alpha: 1.00)
        weightTheme.frame = CGRect(x: maleLabel.frame.minX,
                                   y: HeightTheme.frame.maxY+20,
                                   width: maleLabel.frame.width,
                                   height: maleLabel.frame.height)
        weightTheme.layer.cornerRadius = 5
        weightTheme.clipsToBounds = true
        weightStepper.tintColor = .white
        weightStepper.frame = CGRect(x: weightTheme.frame.minX+20,
                                     y: weightTheme.frame.maxY-50,
                                     width: weightTheme.frame.width-5,
                                     height: 20)
        weightStepper.center.x = weightTheme.center.x
        weightStepper.maximumValue = 150
        weightStepper.minimumValue = 10
        weightStepper.tintColor = .white
        weightStepper.backgroundColor = .gray
        weightStepper.layer.cornerRadius = 10
        weightStepper.clipsToBounds = true
        weightTheme.text = "\(Int(weightStepper.value))"
        weightTheme.textAlignment = .center
        weightTheme.textColor = .white
        weightTheme.font = UIFont.systemFont(ofSize: 20)
        weightStepper.addTarget(self, action: #selector(weightStepperValueChanged), for: .valueChanged)
        weightText.text = "WEIGHT"
        weightText.textColor = .gray
        weightText.textAlignment = .center
        weightText.center.x = weightTheme.center.x
        weightText.center.y = weightTheme.frame.minY+30
        weightText.backgroundColor = weightTheme.backgroundColor
        weightText.font = UIFont(name: "", size: 27)
        // Age label
        ageTheme.backgroundColor = weightTheme.backgroundColor
        ageTheme.frame = CGRect(x: femaleTheme.frame.minX,
                                y: weightTheme.frame.minY,
                                width: femaleTheme.frame.width,
                                height: femaleTheme.frame.height)
        ageTheme.layer.cornerRadius = 5
        ageTheme.clipsToBounds = true
        ageStepper.tintColor = .white
        ageStepper.frame = CGRect(x: ageTheme.frame.minX+20,
                                  y: ageTheme.frame.maxY-50,
                                  width: ageTheme.frame.width-5,
                                  height: 20)
        ageStepper.center.x = ageTheme.center.x
        ageStepper.maximumValue = 120
        ageStepper.minimumValue = 1
        ageStepper.tintColor = .white
        ageStepper.backgroundColor = .gray
        ageStepper.layer.cornerRadius = 10
        ageStepper.clipsToBounds = true
        ageTheme.text = "\(Int(ageStepper.value))"
        ageTheme.textAlignment = .center
        ageTheme.textColor = .white
        ageTheme.font = UIFont.systemFont(ofSize: 27)
        ageStepper.addTarget(self, action: #selector(ageStepperValueChanged), for: .valueChanged)
        ageText.text = "AGE"
        ageText.textColor = .gray
        ageText.textAlignment = .center
        ageText.center.x = ageTheme.center.x
        ageText.center.y = ageTheme.frame.minY+30
        ageText.backgroundColor = ageTheme.backgroundColor
        ageText.font = UIFont(name: "", size: 27)
        
        //calculate
        caculateButton.setTitle("CALCULATE", for: .normal)
        caculateButton.setTitleColor(UIColor.white, for: .normal)
        caculateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        caculateButton.backgroundColor = UIColor(red: 0.91, green: 0.23, blue: 0.43, alpha: 1.00)
        
        caculateButton.layer.cornerRadius = 10
        caculateButton.layer.masksToBounds = true
        caculateButton.frame = CGRect(x: 20,
                                      y: view.frame.maxY - 100,
                                      width: view.frame.width - 20 * 2,
                                      height: 50)
        // thêm gesture cho button caculate
        caculateButton.addTarget(self, action: #selector(goToSecondVC), for: .touchUpInside)
        // thêm gesture cho button gender
        maleLabel.isUserInteractionEnabled = true
        femaleTheme.isUserInteractionEnabled = true
        let maleTapGesture = UITapGestureRecognizer(target: self, action: #selector(maleLabelTapped))
        let femaleTapGesture = UITapGestureRecognizer(target: self, action: #selector(femaleLabelTapped))
        maleLabel.addGestureRecognizer(maleTapGesture)
        femaleTheme.addGestureRecognizer(femaleTapGesture)
    }
    
    @objc func maleLabelTapped() {
        isMaleSelected = true
        updateGenderSelection()
    }
    
    @objc func femaleLabelTapped() {
        isMaleSelected = false
        updateGenderSelection()
    }
    
    private func updateGenderSelection() {
        if isMaleSelected {
            maleLabel.backgroundColor = UIColor(red: 0.16, green: 0.13, blue: 0.24, alpha: 1.00)
            femaleTheme.backgroundColor = UIColor(red: 0.22, green: 0.20, blue: 0.27, alpha: 1.00)
            femaleText.backgroundColor = femaleTheme.backgroundColor
            MaleText.backgroundColor = maleLabel.backgroundColor
        } else {
            maleLabel.backgroundColor = UIColor(red: 0.22, green: 0.20, blue: 0.27, alpha: 1.00)
            femaleTheme.backgroundColor = UIColor(red: 0.16, green: 0.13, blue: 0.24, alpha: 1.00)
            femaleText.backgroundColor = femaleTheme.backgroundColor
            MaleText.backgroundColor = maleLabel.backgroundColor
        }
    }
    
    @objc private func heightSliderValueChanged() {
        heightValueLabel.text = "\(Int(heightSlider.value))cm"
    }
    
    @objc func ageStepperValueChanged() {
        ageTheme.text = "\(Int(ageStepper.value))"
    }
    @objc func weightStepperValueChanged() {
        weightTheme.text = "\(Int(weightStepper.value))"
    }
    private func calculateBMI() -> Double {
        let heightInMeters = Double(heightSlider.value) / 100
        let weightInKg = Double(weightStepper.value)
        return weightInKg / (heightInMeters * heightInMeters)
    }

    @objc func goToSecondVC() {
        let secondVC = SecondViewController()
        let bmiValue = calculateBMI()
        secondVC.bmiValue = bmiValue
        secondVC.passData = { param1, param2 in
            self.caculateButton.setTitle("CALCULATE", for: .normal)
        }

        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true)
    }
}
