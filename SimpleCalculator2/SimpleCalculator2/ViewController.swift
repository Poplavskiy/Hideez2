//
//  ViewController.swift
//  SimpleCalculator2
//
//  Created by POPLAVSKYI VOLODYMYR on 4/9/17.
//  Copyright © 2017 POPLAVSKYI VOLODYMYR. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var stillTypingNumber = false
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var sign: String = ""
    var dotUsed = false
    var currentValue: Double {
        get{
            return Double(resultLabel.text!)!
        }
        set{
            resultLabel.text = "\(newValue)"
            stillTypingNumber = false
        }
    }
    @IBAction func resetPressed(_ sender: UIButton) {
        
        stillTypingNumber = false
        firstNumber = 0
        secondNumber = 0
        currentValue = 0
        resultLabel.text = "0"
        dotUsed = false
    }
    @IBAction func signPressed(_ sender: UIButton) {
        resultLabel.text = "-\(resultLabel.text!)"
    }
    @IBAction func percentagePressed(_ sender: UIButton) {
        if firstNumber == 0 {
            currentValue = currentValue / 100
        }
        else {
            resultLabel.text = String(firstNumber * currentValue / 100)
            secondNumber = Double(resultLabel.text!)!
        }
    }
    @IBAction func plusPressed(_ sender: UIButton) {
        dotUsed = false
        firstNumber = currentValue
        stillTypingNumber = false
        sign = "➕"
    }
    @IBAction func minusPressed(_ sender: UIButton) {
        firstNumber = currentValue
        stillTypingNumber = false
        sign = "➖"
        currentValue = Double(resultLabel.text!)!
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTypingNumber {
        if (resultLabel.text?.characters.count)! < 20 {
            resultLabel.text = resultLabel.text! + number
            
        } } else {resultLabel.text = number
            stillTypingNumber = true
            }
        
    }
    @IBAction func multiplyPressed(_ sender: UIButton) {
        firstNumber = currentValue
        stillTypingNumber = false
        sign = "✖️"
    }
    @IBAction func devidePressed(_ sender: UIButton) {
        firstNumber = currentValue
        stillTypingNumber = false
        sign = "➗"
    }
    @IBAction func squarePressed(_ sender: UIButton) {
        firstNumber = sqrt(Double(resultLabel.text!)!)
        stillTypingNumber = false
        resultLabel.text = "\(firstNumber)"
    }
    @IBAction func dotPressed(_ sender: UIButton) {
        if stillTypingNumber && !dotUsed {
            resultLabel.text = resultLabel.text! + "."
            dotUsed = true
        }  else if !stillTypingNumber && !dotUsed {
            resultLabel.text = "0."
        }

        
        
    }
    @IBAction func equalPressed(_ sender: UIButton) {
        
        if stillTypingNumber {
            secondNumber = Double(resultLabel.text!)!
        }
        stillTypingNumber = false
        dotUsed = false
        
        switch sign {
        case "➕":
            resultLabel.text = String(firstNumber + secondNumber)
            print("current number - \(currentValue) fv -\(firstNumber) sn = \(secondNumber)")
        case "➖":
            resultLabel.text = String(firstNumber - secondNumber)
        case "✖️":
            resultLabel.text = String(firstNumber * secondNumber)
        case "➗":
            resultLabel.text = String(firstNumber / secondNumber)
        default:
            resultLabel.text = "There is some Error here !"
        }
            }


}

