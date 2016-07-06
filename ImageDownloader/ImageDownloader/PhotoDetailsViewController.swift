//
//  PhotoDetailsViewController.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 03/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import AssetsLibrary
class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var photo:Photo!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.kf_setImageWithURL(NSURL(string: self.photo.url)!)
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func savePhoto(sender: UIButton) {
        //error
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0)
        ALAssetsLibrary().writeImageDataToSavedPhotosAlbum(imageData, metadata: nil, completionBlock: nil)
        
        
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
