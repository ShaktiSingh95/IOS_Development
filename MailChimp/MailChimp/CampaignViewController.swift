//
//  CampaignViewController.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 01/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class CampaignViewController: UIViewController {

    var listId:String!
    @IBAction func createNewCampaign(sender: UIButton) {
        
        let destinationVC = self.storyboard?.instantiateViewControllerWithIdentifier("new_campaign_form") as! CreateCampaignViewController
        destinationVC.listId=self.listId
        self.showViewController(destinationVC, sender: nil)
        
    }

    @IBAction func fetchExistingCampaigns(sender: UIButton) {
        
        
        let destinationVC = self.storyboard?.instantiateViewControllerWithIdentifier("existing_campaigns") as! ExistingCampaignsViewController
        destinationVC.listID=self.listId
        self.showViewController(destinationVC, sender: nil)

        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
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
