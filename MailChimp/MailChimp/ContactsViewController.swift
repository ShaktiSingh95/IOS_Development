//
//  ContactsViewController.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 28/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var listId: String!

    var contact=[ContactList]()
    @IBOutlet weak var contactTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let addContactsBarButton=UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.Plain , target: self, action: #selector(ContactsViewController.displayAddNewContact))
        self.navigationItem.rightBarButtonItem=addContactsBarButton
        self.contactTableView.dataSource=self
        self.contactTableView.delegate=self
        
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        MailChimpModel.fetchContactsOfList(listId,afterFetching: {contactList in self.contact=contactList
            self.contactTableView.reloadData()
            })
        //self.contactTableView.reloadData()
    }
    func displayAddNewContact(){
        
        let contactFormViewController = self.storyboard?.instantiateViewControllerWithIdentifier("new_contact_form") as! ContactAdditionViewController
        contactFormViewController.listId=self.listId
        self.showViewController(contactFormViewController, sender: nil)
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
     cell = tableView.dequeueReusableCellWithIdentifier("contacts_cell")!
//cell = tableView.dequeueReusableCellWithIdentifier("contacts_cell")!

        cell.textLabel?.text=contact[indexPath.row].name
        cell.detailTextLabel?.text=contact[indexPath.row].emailAdd
        return cell
}
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive,title: "delete"){handler in
            MailChimpModel.deleteContactFromList(self.listId,emailAdd: self.contact[indexPath.row].emailAdd,handler:{
                let destinationVC = self.storyboard?.instantiateViewControllerWithIdentifier("deletion_complete") as! DeletionViewController
            self.showViewController(destinationVC, sender: nil)})
        }
        return [delete]
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
