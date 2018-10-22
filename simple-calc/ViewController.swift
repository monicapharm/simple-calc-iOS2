//
//  ViewController.swift
//  simple-calc
//
//  Created by Liuqing Ma on 10/16/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0;
    var numberOnScreenStr: String = "";
    var previousNumber: Double = 0;
    var previousNumStr: String = "";
    var performingMath = false;
    var operation = 0;
    var count = 0;
    var sum: Double = 0;
    var history: String = ""

    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag-1)
            numberOnScreenStr = label.text!
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreenStr = label.text!
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 18
        {
            previousNumStr = label.text!
            previousNumber = Double(label.text!)!
            if sender.tag == 14 { // divide
                label.text = "/"
            } else if sender.tag == 15 { // multiply
                label.text = "×"
            } else if sender.tag == 16 { // minus
                label.text = "-"
            } else if sender.tag == 17 { // plus
                label.text = "+"
            } else if sender.tag == 19 { // history
                NSLog("the history:" + history)
                performSegue(withIdentifier: "segue", sender: self)
            } else if sender.tag == 20 { // count
                count += 1
                label.text = "count"
            } else if sender.tag == 12 { // average
                count += 1
                sum += numberOnScreen
                label.text = "ave"
            } else if sender.tag == 13 { // fact
                label.text = "!"
            }
            operation = sender.tag
            history += "\n" + previousNumStr
            history += label.text!
            performingMath = true
        }
        else if sender.tag == 18 { // equals
            if operation == 14 {
                label.text = String(previousNumber / numberOnScreen)
            } else if operation == 15 {
                label.text = String(previousNumber * numberOnScreen)
            } else if operation == 16 {
                label.text = String(previousNumber - numberOnScreen)
            } else if operation == 17 {
                label.text = String(previousNumber + numberOnScreen)
            } else if operation == 19 {
            } else if operation == 20 {
                label.text = String(count + 1)
            } else if operation == 12 { // average
                label.text = String((sum + numberOnScreen) / Double(count+1))
            } else if operation == 13 {
                var fact: Int = 1
                var number: Int = Int(previousNumber)
                while (number >= 1) {
                    fact = fact * number
                    number -= 1
                }
                label.text = String(fact)
            }
            history += numberOnScreenStr
            history += "=" + label.text!
        }
        else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            count = 0
            sum = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SecondViewController
        secondController.history = history
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

