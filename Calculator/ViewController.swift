//
//  ViewController.swift
//  Calculator
//
//  Created by andrew on 21.07.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBOutlet weak var holder: UIView!
    	
    var firstNumber = 0
    var resultNumber = 0
    var currentOperations: Operation?
    
    enum Operation {
        case add,subtract,multiply,divide
    }
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 100)
        return label
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupNumberPad()
    }

    private func setupNumberPad() {
        let fontSize:CGFloat = 25
        let buttonSize:CGFloat = view.frame.size.width/4
        let zeroButton = UIButton(frame: CGRect(x: 0, y:holder.frame.size.height-buttonSize, width: buttonSize*3, height: buttonSize))
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.backgroundColor = .white
        zeroButton.setTitle("0", for: .normal)
        zeroButton.titleLabel?.font = UIFont(name: "Helvetica", size: fontSize)
        zeroButton.tag = 1
        holder.addSubview(zeroButton)
        zeroButton.addTarget(self, action: #selector(zeroTapped), for: .touchUpInside)
        
        for x in 0..<3 {
            let buttonRow1 = UIButton(frame:CGRect(x: buttonSize*CGFloat(x), y: holder.frame.size.height-buttonSize*2, width: buttonSize, height: buttonSize))
            buttonRow1.setTitleColor(.black, for: .normal)
            buttonRow1.backgroundColor = .white
            buttonRow1.setTitle("\(x+1)", for: .normal)
            holder.addSubview(buttonRow1)
            buttonRow1.tag = x+2
            buttonRow1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        for x in 0..<3 {
            let buttonRow2 = UIButton(frame:CGRect(x: buttonSize*CGFloat(x), y: holder.frame.size.height-buttonSize*3, width: buttonSize, height: buttonSize))
            buttonRow2.setTitleColor(.black, for: .normal)
            buttonRow2.backgroundColor = .white
            buttonRow2.setTitle("\(x+4)", for: .normal)
            holder.addSubview(buttonRow2)
            buttonRow2.tag = x+5
            buttonRow2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        for x in 0..<3 {
            let buttonRow3 = UIButton(frame:CGRect(x: buttonSize*CGFloat(x), y: holder.frame.size.height-buttonSize*4, width: buttonSize, height: buttonSize))
            buttonRow3.setTitleColor(.black, for: .normal)
            buttonRow3.backgroundColor = .white
            buttonRow3.setTitle("\(x+7)", for: .normal)
            holder.addSubview(buttonRow3)
            buttonRow3.tag = x+8
            buttonRow3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        
        let clearButton = UIButton(frame:CGRect(x: 0, y: holder.frame.size.height-(buttonSize*5), width: holder.frame.size.width - buttonSize, height: buttonSize))
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = .cyan
        clearButton.titleLabel?.font = UIFont(name: "Helvetica", size: fontSize-4)
        clearButton.setTitle("CE", for: .normal)
        holder.addSubview(clearButton)
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
        let operations = ["=","+", "-", "x", "÷"]
        
        for x in 0..<operations.count {
            let button_operand = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height-(buttonSize * CGFloat(x+1)), width: buttonSize, height: buttonSize))
            button_operand.setTitleColor(.black, for: .normal)
            button_operand.backgroundColor = .yellow
            button_operand.setTitle(operations[x], for: .normal)
            holder.addSubview(button_operand)
            button_operand.tag = x+1
            button_operand.titleLabel?.font = UIFont(name: "Helvetica", size: fontSize)
            button_operand.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        }
        resultLabel.frame = CGRect(x: 20, y: clearButton.frame.origin.y - 110, width: view.frame.size.width - 40 , height: 100)
    }
    
        @objc func clearResult() {
            resultLabel.text = "0"
            currentOperations = nil
            firstNumber = 0
        }
        
        @objc func zeroTapped() {
            if resultLabel.text != "0" {
                if let text = resultLabel.text {
                    resultLabel.text = "\(text)\(0)"
                }
            }
        }
    
        @objc func numberPressed(_ sender: UIButton) {
            let tag = sender.tag - 1
            
            if resultLabel.text == "0" {
                resultLabel.text = "\(tag)"
            }
            else if let text = resultLabel.text {
                resultLabel.text = "\(text)\(tag)"
            }
        }
        @objc func operationPressed(_ sender: UIButton) {
           let tag = sender.tag
           if let text = resultLabel.text, let value = Int(text), firstNumber == 0 {
               firstNumber = value
               resultLabel.text = "0"
           }
           
           if tag == 1 {
               if let operation = currentOperations {
                   var secondNumber = 0
                   if let text = resultLabel.text, let value = Int(text) {
                       secondNumber = value
                   }
                   
                   switch operation {
                   case .add:
                       
                       firstNumber = firstNumber + secondNumber
                       secondNumber = 0
                       resultLabel.text = "\(firstNumber)"
                       currentOperations = nil
                       firstNumber = 0
                       
                       break
                       
                   case .subtract:
                       firstNumber = firstNumber - secondNumber
                       secondNumber = 0
                       resultLabel.text = "\(firstNumber)"
                       currentOperations = nil
                       firstNumber = 0
                       
                       break
                       
                   case .multiply:
                       firstNumber = firstNumber * secondNumber
                       secondNumber = 0
                       resultLabel.text = "\(firstNumber)"
                       currentOperations = nil
                       firstNumber = 0
                       
                       break
                       
                   case .divide:
                       firstNumber = firstNumber / secondNumber
                       secondNumber = 0
                       resultLabel.text = "\(firstNumber)"
                       currentOperations = nil
                       firstNumber = 0
                       break
                   }
               }
           }
           else if tag == 2 {
               currentOperations = .add
           }
           else if tag == 3 {
               currentOperations = .subtract
           }
           else if tag == 4 {
               currentOperations = .multiply
           }
           else if tag == 5 {
               currentOperations = .divide
           }
       }
   }
    

