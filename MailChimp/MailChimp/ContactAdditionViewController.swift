//
//  ContactAdditionViewController.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 30/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class ContactAdditionViewController: UIViewController {

    var listId: String!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveContact(sender: UIButton) {
        
        MailChimpModel.addContact(listId, email: emailAddress.text!,fName: self.firstName.text!,lName: self.lastName.text!){handler in self.navigationController?.popViewControllerAnimated(true)
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
