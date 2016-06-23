//
//  ViewController.swift
//  SliderGame
//
//  Created by Shakti Pratap Singh on 22/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomGenerated: UITextField!

  
    var expectedResult : Int?
    var userInput : Int?
    
    @IBAction func slider(sender: UISlider) {
        
        
        userInput=Int(sender.value)

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func play() {
        
        expectedResult = Int(arc4random_uniform(100))
        randomGenerated.text = "Predict the position of : " + String(expectedResult!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func verifyInputWithRandomNoGenerated(sender: UIButton) {
        
        
        if userInput != nil && expectedResult != nil{
            
            let accuracy = userInput! - expectedResult!
            
            let resultVC = storyboard?.instantiateViewControllerWithIdentifier("result_VC") as! ResultViewController
            resultVC.accuracy = accuracy
            showViewController(resultVC, sender:nil)
            
            
        }
        
    }
}

