//
//  FiltersViewController.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 03/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var filterTableView: UITableView!
    
    var param:String!
    var filterOptionListner: FilterOptionsListner!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filterTableView.dataSource=self
        self.filterTableView.delegate=self
        
        // Do any additional setup after loading the view.
    }
    func giveBackDataTo(listner: FilterOptionsListner){
        
        filterOptionListner = listner
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.Filter.filterOptions.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Cell.cellInFilterTableView) as! FilterTableViewCell
        cell.filterOption.text = Constants.Filter.filterOptions[indexPath.row]
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    let cell = tableView.cellForRowAtIndexPath(indexPath) as! FilterTableViewCell
       
        cell.filterSwitch.setOn(true, animated: true)
      filterOptionListner.parametersToaddInSearch(Constants.Filter.filterOptions[indexPath.row])
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
