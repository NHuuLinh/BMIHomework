//
//  SecondViewController.swift
//  BMI HomeWork
//
//  Created by LinhMAC on 24/07/2023.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var onBack: UIButton!
    @IBOutlet weak var headLine: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultStatus: UITextField!
    @IBOutlet weak var BMIResult: UITextField!
    @IBOutlet weak var commentText: UITextField!
    
    var passData: ((String, Int) -> Void)?
    var bmiValue: Double = 0.0
    
    override func viewDidLoad() {
        onBack.setTitle("RE-CALCULATE", for: .normal)
        onBack.setTitleColor(UIColor.white, for: .normal)
        onBack.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        onBack.backgroundColor = UIColor(red: 0.91, green: 0.23, blue: 0.43, alpha: 1.00)
        onBack.layer.cornerRadius = 10
        onBack.layer.masksToBounds = true
        onBack.frame = CGRect(x: 20,
                                      y: view.frame.maxY - 100,
                                      width: view.frame.width - 20 * 2,
                                      height: 50)
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.10, green: 0.12, blue: 0.20, alpha: 1.00)
        headLine.backgroundColor = view.backgroundColor
        resultLabel.backgroundColor = UIColor(red: 0.22, green: 0.20, blue: 0.27, alpha: 1.00)
        resultLabel.frame = CGRect(x: 20,
                                   y: headLine.frame.maxY+20,
                                   width: view.frame.maxX-20,
                                   height: 580)
        resultLabel.text = ""
        resultLabel.layer.cornerRadius = 5
        resultLabel.clipsToBounds = true
        resultStatus.backgroundColor = resultLabel.backgroundColor
        resultStatus.textColor = .green
        resultStatus.frame = CGRect(x: 50,
                                    y: resultLabel.frame.minY+50,
                                    width: resultLabel.frame.width,
                                   height: 50)
        resultStatus.center.x = resultLabel.center.x
        resultStatus.textColor = .green
        BMIResult.textColor = .white
        BMIResult.backgroundColor = resultLabel.backgroundColor
        BMIResult.text = String(format: "%.1f", bmiValue)
        commentText.textColor = .white
        commentText.backgroundColor = resultLabel.backgroundColor
        commentText.frame = CGRect(x: resultLabel.frame.minX,
                                   y: resultLabel.frame.maxY-100,
                                   width: resultLabel.frame.width ,
                                   height: 100)
        // Đổi màu và nội dung tùy theo giá trị BMI
        if bmiValue < 18.5 {
            resultStatus.textColor = .blue
            resultStatus.text = "Gầy"
            commentText.text = "Bạn đang thiếu cân, ăn thêm đi bạn"
        } else if bmiValue < 24.9 {
            resultStatus.textColor = .green
            resultStatus.text = "Bình thường"
            commentText.text = "Bạn có chỉ số rất tốt, hãy duy trì nhé! "
        } else if bmiValue < 29.9 {
            resultStatus.textColor = .orange
            resultStatus.text = "Thừa cân"
            commentText.text = "Hơi béo rồi, ăn uống điều độ nhé"
        } else if bmiValue < 34.9 {
            resultStatus.textColor = .red
            resultStatus.text = "Béo phì"
            commentText.text = "Béo rồi,thể dục, ăn uống điều độ nhé"
        } else {
            resultStatus.textColor = .purple
            resultStatus.text = "Béo phì nguy hiểm"
            commentText.text = "Nguy hiểm, bạn cần ăn uống, tập luyện điều độ"
        }
    }
    @IBAction func onBack(_ sender: Any) {
        passData?("RE-CALCULATE", 2023)
        dismiss(animated: true)
    }
}
    
