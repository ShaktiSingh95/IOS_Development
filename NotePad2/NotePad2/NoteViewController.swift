//
//  NoteViewController.swift
//  NotePad2
//
//  Created by Shakti Pratap Singh on 20/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var detailsOfNote: UITextField!
    @IBOutlet weak var titleOfNote: UITextField!
   var titlePassed : String!
    var detailsPassed : String!
    var noteID: Int!
    var listner : TextChangedListner!
    func initialize(noteID :Int,title :String, details:String){

        titlePassed=title
        detailsPassed=details
        self.noteID=noteID
    }
    func reportChangesTo(listner: TextChangedListner){
        
        self.listner = listner
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(titlePassed)
        self.titleOfNote.text=titlePassed
        self.detailsOfNote.text=detailsPassed
        titleOfNote.allowsEditingTextAttributes = true
        
        
    }

    @IBAction func save(sender: UIButton) {
        
        if titleOfNote.text != titlePassed{
            
            listner.titleChanged(titleOfNote.text,noteID: noteID)
        
        }
        
        if detailsOfNote.text != detailsPassed{
            
            listner.detailsChanged(detailsOfNote.text,noteID: noteID)
            
        }
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
