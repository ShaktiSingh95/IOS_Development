//
//  CreateCampaignViewController.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 01/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class CreateCampaignViewController: UIViewController {

    var listId:String!
    @IBOutlet weak var message: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var toName: UITextField!
    @IBOutlet weak var fromName: UITextField!
    @IBOutlet weak var fromEmail: UITextField!
    @IBAction func createNewCampaign(sender: UIButton) {
        
        MailChimpModel.createCampaign(self.listId, subject:self.subject.text!, fromEmail: self.fromEmail.text!, fromName: self.fromName.text!, toName: self.toName.text!, message: self.message.text!)
        {handler in self.navigationController?.popViewControllerAnimated(true)}
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
