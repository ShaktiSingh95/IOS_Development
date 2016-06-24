//
//  ViewController.swift
//  NotePad2
//
//  Created by Shakti Pratap Singh on 19/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

//shouldperformsague...
//performsaguewithidentifier
//this is a
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var viewTableVar: UITableView! //this will be nil only before the call of viewdidload(beacause of !)
   // var noteToBeDisplayed:Note?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTableVar.dataSource=self
        viewTableVar.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Note.allNotes().count
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Default, title: "Delete"){(action,indexPath) in //will delete from model
        }
        return [delete]
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        var cell:UITableViewCell
        let noteAtPassedIndex = Note.allNotes()[row]
        cell = tableView.dequeueReusableCellWithIdentifier("one")!
        cell.textLabel?.text=noteAtPassedIndex.title
        cell.detailTextLabel?.text=noteAtPassedIndex.details
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        let destinationVC = storyboard?.instantiateViewControllerWithIdentifier("notes_details") as! NoteViewController
       // print(Note.allNotes()[row].title)
        destinationVC.initialize(Note.allNotes()[row].title,details: Note.allNotes()[row].details)
//        destinationVC.titlePassed =
//        destinationVC.detailsPassed =
        showViewController(destinationVC, sender: nil)
                

}
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if let destinationVC = segue.destinationViewController as? NoteViewController{
//            
//            destinationVC.detailsOfNote.text=noteToBeDisplayed!.details // this an error because although the object of destination of view cotroller is loaded but still its view is not still loaded
//            destinationVC.titleOfNote.text=noteToBeDisplayed!.title
//            destinationVC.noteClicked=noteToBeDisplayed
//            
//        }
//        
    
  }


