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
        case add,subtract,miltiplay,divide
    }
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 115)
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
       // zeroButton.addTarget(self, action: #selector(zeroTapped), for: .touchUpInside)
        
        for x in 0..<3 {
            let buttonRow1 = UIButton(frame:CGRect(x: buttonSize*CGFloat(x), y: holder.frame.size.height-buttonSize*2, width: buttonSize, height: buttonSize))
            buttonRow1.setTitleColor(.black, for: .normal)
            buttonRow1.backgroundColor = .white
            buttonRow1.setTitle("\(x+1)", for: .normal)
            holder.addSubview(buttonRow1)
            buttonRow1.tag = x+2
        //    buttonRow1.addTarget(self, action: #selector(numberPassed(_:)), for: .touchUpInside)
        }
        for x in 0..<3 {
            let buttonRow2 = UIButton(frame:CGRect(x: buttonSize*CGFloat(x), y: holder.frame.size.height-buttonSize*2, width: buttonSize, height: buttonSize))
            buttonRow2.setTitleColor(.black, for: .normal)
            buttonRow2.backgroundColor = .white
            buttonRow2.setTitle("\(x+4)", for: .normal)
            holder.addSubview(buttonRow2)
            buttonRow2.tag = x+5
         //   buttonRow2.addTarget(self, action: #selector(numberPassed(_:)), for: .touchUpInside)
        }
        for x in 0..<3 {
            let buttonRow3 = UIButton(frame:CGRect(x: buttonSize*CGFloat(x), y: holder.frame.size.height-buttonSize*2, width: buttonSize, height: buttonSize))
            buttonRow3.setTitleColor(.black, for: .normal)
            buttonRow3.backgroundColor = .white
            buttonRow3.setTitle("\(x+7)", for: .normal)
            holder.addSubview(buttonRow3)
            buttonRow3.tag = x+8
          //  buttonRow3.addTarget(self, action: #selector(numberPassed(_:)), for: .touchUpInside)
        }
        
    }
    
}

