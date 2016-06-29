//
//  ContactsViewController.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 28/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController,UITableViewDataSource {

    var listId: String!
    var contact=[ContactList]()
    @IBOutlet weak var contactTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactTableView.dataSource=self
        MailChimpModel.fetchContactsOfList(listId,afterFetching: {contactList in self.contact=contactList
            self.contactTableView.reloadData()
            }
        )
        
        
        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        cell = tableView.dequeueReusableCellWithIdentifier("contacts_cell")!
        cell.textLabel?.text=contact[indexPath.row].name
        cell.detailTextLabel?.text=contact[indexPath.row].emailAdd
        return cell
}
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count    }
    
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
