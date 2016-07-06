//
//  ToDoFormViewController.swift
//  ToDoList
//
//  Created by Shakti Pratap Singh on 06/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import CoreData
class ToDoFormViewController: UIViewController {

    @IBOutlet weak var nameOfUser: UITextField!
    @IBOutlet weak var titleOfTask: UITextField!
    var appDelegate : AppDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func createNewTask(sender: UIButton) {
        
        if nameOfUser.text != nil && titleOfTask.text != nil{
            
            let insertedObject = NSEntityDescription.insertNewObjectForEntityForName("ToDo", inManagedObjectContext: appDelegate.managedObjectContext) as! ToDo
            insertedObject.task = titleOfTask.text
            insertedObject.user = nameOfUser.text
            try! appDelegate.managedObjectContext.save()
            self.navigationController?.popViewControllerAnimated(true)
            
        }
        
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
