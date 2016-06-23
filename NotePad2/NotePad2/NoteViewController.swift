//
//  NoteViewController.swift
//  NotePad2
//
//  Created by Shakti Pratap Singh on 20/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var titleOfNote: UITextField!
    
    @IBOutlet weak var detailsOfNote: UITextField!
    
    var editedTitle : String?
    var editedDetails : String?
    var noteClicked : Note?
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }

    @IBAction func save(sender: UIButton) {
        
        //code to update this note
        
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
