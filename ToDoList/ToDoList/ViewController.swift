//
//  ViewController.swift
//  ToDoList
//
//  Created by Shakti Pratap Singh on 05/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var toDataTableView: UITableView!
    private let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    var toDoEntityDataFetched: [ToDo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDataTableView.delegate = self
        self.toDataTableView.dataSource = self
        let addBarButton = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(addNewTask))
        self.navigationItem.setRightBarButtonItem(addBarButton, animated: true)
        //NSManagedObjectContext.executeFetchRequest(toDoListFetchRequest)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let toDoEntityFetchRequest = NSFetchRequest(entityName: "ToDo")
        
        toDoEntityDataFetched = try! appDelegate.managedObjectContext.executeFetchRequest(toDoEntityFetchRequest) as! [ToDo]
        print("fetched")
        
        toDataTableView.reloadData()
        print("****\(toDoEntityDataFetched.count)")
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let user = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "AssignUser"){
        handler in let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.UserRelated.userTableViewControllerIdentifier) as! UserViewController
            destinationVc.taskId = indexPath.row
            destinationVc.appDelegate = self.appDelegate
            self.showViewController(destinationVc, sender: nil)
        
        }
        return [user]
    }
    func addNewTask() {
        
        let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.ToDoRelated.toDoFormViewControllerIdentifier) as! ToDoFormViewController
        destinationVc.appDelegate = self.appDelegate

        showViewController(destinationVc, sender: nil)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(toDoEntityDataFetched.count)
        return toDoEntityDataFetched.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.toDataTableView.dequeueReusableCellWithIdentifier(Constants.ToDoRelated.toDoTableViewCellIndentifier)!
        cell.textLabel?.text = toDoEntityDataFetched[indexPath.row].task
        cell.detailTextLabel?.text = toDoEntityDataFetched[indexPath.row].user
        print("cell returned")
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

