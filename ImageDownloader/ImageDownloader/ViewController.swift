//
//  ViewController.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 03/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchedKey: UITextField?
    @IBAction func search(sender: UIButton) {
        
        let destinationVC = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.IdentifiersForViewController.photosViewControllerIdentifier) as! PhotosViewController
        if self.searchedKey!.text==""{
            destinationVC.searchedKey="image"
        }
        else{
        destinationVC.searchedKey = self.searchedKey!.text
        }
        showViewController(destinationVC, sender: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        self.searchedKey!.text=""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

