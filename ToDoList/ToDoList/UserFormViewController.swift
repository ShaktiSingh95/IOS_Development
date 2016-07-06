//
//  UserFormViewController.swift
//  ToDoList
//
//  Created by Shakti Pratap Singh on 06/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import CoreData
class UserFormViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    var appDelegate:AppDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createUser(sender: UIButton) {
        
        if userName.text != nil{
            
            let insertedObject = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: appDelegate.managedObjectContext) as! User
            insertedObject.name = userName.text
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
