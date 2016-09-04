//
//  OutputViewController.swift
//  HappyNumberCalculator
//
//  Created by Ameya Singh on 8/31/16.
//  Copyright © 2016 Ameya Singh. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController {

    @IBOutlet weak var outputBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputBox.text = sharedString
        
        // Do any additional setup after loading the view.
    }
    @IBAction func refresh(_ sender: AnyObject) {
        outputBox.text = sharedString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
