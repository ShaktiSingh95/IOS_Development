//
//  ViewController.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 28/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var list = [List]()
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.dataSource=self
        self.listTableView.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        MailChimpModel.fetchList{ listFetched in self.list=listFetched
            self.listTableView.reloadData()}
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
       return true
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let destinationVC = self.storyboard?.instantiateViewControllerWithIdentifier("campaign_vc") as! CampaignViewController
        
        let campaign = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "campaign"){handler in destinationVC.listId = self.list[indexPath.row].id
            self.showViewController(destinationVC, sender: nil)
        }
        
        return [campaign]
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        cell = listTableView.dequeueReusableCellWithIdentifier("list_cell")!
        cell.textLabel?.text=list[indexPath.row].name
        cell.detailTextLabel?.text=list[indexPath.row].id
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let destinationVC = self.storyboard?.instantiateViewControllerWithIdentifier("contacts_view_controller") as! ContactsViewController
        destinationVC.listId = list[indexPath.row].id
        showViewController(destinationVC, sender:nil)
        
    }
    
}

