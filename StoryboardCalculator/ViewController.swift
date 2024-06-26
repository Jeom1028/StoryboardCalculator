//
//  ViewController.swift
//  StoryboardCalculator
//
//  Created by t2023-m0117 on 6/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var currentInput: String = ""
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let tag = sender.tag
        
        switch tag {
        case 0...9 , 10...13:
            // 숫자 버튼 및 연산자 버튼
            if let digit = sender.titleLabel?.text {
                currentInput += digit
                resultLabel.text = currentInput
            }
        case 14:
            // C 버튼
            clear()
        case 15:
            if currentInput == "0" {
                resultLabel.text = "error"
            } else {
                if let result = calculate(expression: currentInput) {
                    resultLabel.text = "\(result)"
                } else {
                    resultLabel.text = "error"
                }
            }
            
            // = 버튼
        default:
            break
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
        // Do any additional setup after loading the view.
    }
        
        
        func calculate(expression: String) -> Int? {
            let expression = NSExpression(format: expression)
            if let result = expression.expressionValue(with: nil, context: nil) as? Int {
                return result
            } else {
                return nil
            }
        }
        
        func clear() {
            currentInput = ""
            resultLabel.text = "0"
        }
    }
