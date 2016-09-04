//
//  ViewController.swift
//  HappyNumberCalculator
//
//  Created by Ameya Singh on 8/31/16.
//  Copyright © 2016 Ameya Singh. All rights reserved.
//

import UIKit

var sharedString: String = ""

class ViewController: UIViewController {

    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var inputBox: UITextField!
    @IBOutlet weak var progBar: UIProgressView!
    var progress: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progBar.setProgress(0.0, animated: true)
        progBar.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapOutside(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: AnyObject) {
        view.endEditing(true)
        allowEdits(allow: false)
        let upperBound: Int = Int(inputBox.text!)!
        happyCalc(upperBound: upperBound)
    }
    
    func happyCalc(upperBound: Int) -> Void{
        let queue = DispatchQueue(label: "com.singhameya.calculate")
        sharedString = ""
        queue.async {
            sharedString = "Happy Numbers:"
            for index in 1...upperBound {
                if (self.testHappy(test: index)){
                    sharedString += "\n\(index)"
                }
                self.progress = Float(Double(index) / Double(upperBound))
                DispatchQueue.main.sync {
                    self.progBar.setProgress(self.progress, animated: true)
                }
            }
            DispatchQueue.main.async {
                self.allowEdits(allow: true)
                self.navigationController?.performSegue(withIdentifier: "ShowOutput", sender: self.calculateBtn)
            }
        }
    }
    
    func testHappy(test: Int) -> Bool{
        var input:Int = test
        var uniqueNums = Set<Int>()
        while !uniqueNums.contains(input) {
            uniqueNums.insert(input)
            var value: Int = 0
            while input > 0 {
                value += Int(pow(Double(input % 10), 2))
                input /= 10
            }
            input = value
        }
        return (input == 1)
    }
    
    func allowEdits(allow: Bool){
        inputBox.isEnabled = allow
        progBar.isHidden = allow
        calculateBtn.isEnabled = allow
    }
    
}

