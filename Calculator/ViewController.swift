//
//  ViewController.swift
//  Calculator
//
//  Created by Vlad Rusu on 4/13/16.
//  Copyright © 2016 3PG. All rights reserved.
//

import UIKit

enum Operation {
    case Plus
    case Minus
    case Divide
    case Multiply
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var digitsButtons: [UIButton]!
    
    var writtenNumber:Int = 0 {
        didSet {
            label.text = String(writtenNumber)
        }
    }
    
    var resultingNumber:Int = 0 {
        didSet {
            label.text = String(resultingNumber)
        }
    }
    
    var operation:Operation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func plusButtonPressed(sender: AnyObject) {
        operation = Operation.Plus
        
        resultingNumber = writtenNumber
        writtenNumber = 0
    }
    
    @IBAction func minusButtonPressed(sender: AnyObject) {
        operation = Operation.Minus
        
        resultingNumber = writtenNumber
        writtenNumber = 0
    }
    
    @IBAction func multiplyButtonPressed(sender: UIButton) {
        operation = Operation.Multiply
        
        resultingNumber = writtenNumber
        writtenNumber = 0
    }
    
    @IBAction func divideButtonPressed(sender: AnyObject) {
        operation = Operation.Divide
        
        resultingNumber = writtenNumber
        writtenNumber = 0
    }
    
    @IBAction func equalsButtonPressed(sender: AnyObject) {
        switch operation! {
            case .Plus: resultingNumber += writtenNumber
            case .Minus: resultingNumber -= writtenNumber
            case .Multiply: resultingNumber *= writtenNumber
            case .Divide: resultingNumber /= writtenNumber
        }
        
        writtenNumber = resultingNumber
    }
    
    @IBAction func digitButtonPressed(sender: UIButton) {
        let index = digitsButtons.indexOf(sender)
        
        writtenNumber = writtenNumber * 10 + index!.advancedBy(0)
    }
    
    @IBAction func clearButtonPressed(sender: AnyObject) {
        writtenNumber = 0
        resultingNumber = 0
    }
    
    @IBAction func bkspButtonPressed(sender: AnyObject) {
        writtenNumber /= 10
    }

}

