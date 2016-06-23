//
//  ResultViewController.swift
//  SliderGame
//
//  Created by Shakti Pratap Singh on 22/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    var accuracy : Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        if accuracy != nil{
            
            result.text = "You just got it it by \(accuracy!) units"
        
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func back() {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
