//
//  ViewController.swift
//  NewsApp
//
//  Created by Shakti Pratap Singh on 13/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let kCloseCellHeight: CGFloat = 187 // equal or greater foregroundView height
    let kOpenCellHeight: CGFloat = 300
    
    @IBOutlet weak var storyTableView: UITableView!
    var stories=[Story](){
        
        didSet{
            
            
            storyTableView.reloadData()
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.storyTableView.delegate = self
        self.storyTableView.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NewsModel.getStories(1, handler : {(stories) in
            self.stories = stories})
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row < stories.count{
            
            let cell = storyTableView.dequeueReusableCellWithIdentifier("story_cell") as! StoryCell
            
            return cell
        }
        else{
            let cell = storyTableView.dequeueReusableCellWithIdentifier("buffer_cell")!
            return cell
            
        }
        
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! StoryCell

        var duration = 0.0
        if cell.height == kCloseCellHeight { // open cell
            cell.height = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cell.height = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            }, completion: nil)
        
    }
     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if cell is StoryCell {
            let foldingCell = cell as! StoryCell
            
            if foldingCell.height == kCloseCellHeight {
                foldingCell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                foldingCell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
    
}

