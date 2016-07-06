//
//  UserViewController.swift
//  ToDoList
//
//  Created by Shakti Pratap Singh on 06/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import CoreData
class UserViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var appDelegate: AppDelegate!
    var dataFetched:[User]!
    @IBOutlet weak var userTableView: UITableView!
    var taskId:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
        let addBarButton = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(addNewUser))
        self.navigationItem.setRightBarButtonItem(addBarButton, animated: true)
        
        // Do any additional setup after loading the view.
    }
    func addNewUser(){
        
        let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.UserRelated.UserFormViewControllerIdentifier) as! UserFormViewController
        destinationVc.appDelegate = self.appDelegate
        
        showViewController(destinationVc, sender: nil)
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let fetchRequest = NSFetchRequest(entityName: "User")
        dataFetched = try! appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as! [User]
        self.userTableView.reloadData()
//       let saveDataObject = NSEntityDescription.insertNewObjectForEntityForName("ToDo", inManagedObjectContext: <#T##NSManagedObjectContext#>)
//
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("**p**\(dataFetched.count)")
        return dataFetched.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.userTableView.dequeueReusableCellWithIdentifier(Constants.UserRelated.userTableViewCellIndentifier)!
        cell.textLabel?.text = dataFetched[indexPath.row].name
        return cell
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
