//
//  SecondViewController.swift
//  simple-calc
//
//  Created by Liuqing Ma on 10/21/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    public var history = String()
    
    @IBOutlet weak var historyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("history:" + history)
        historyLabel.numberOfLines = 10
        historyLabel.text = history

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
