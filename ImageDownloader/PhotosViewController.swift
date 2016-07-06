//
//  PhotosViewController.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 03/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//
//was giving errors editor place holder
import UIKit
import Kingfisher
class PhotosViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,FilterOptionsListner {
    
    var searchedKey : String!
    var page=1
    var destinationVc: FiltersViewController!
    var sort:String="relevance"
    private let placeHolderPhoto = UIImage(named: Constants.Images.placeHolderPhoto)
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var photos=[Photo](){
        didSet{
            
            self.photosCollectionView.reloadData()
            print("*******reload")
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //       let filterButton=UIBarButtonItem(title: "Fliter", style: UIBarButtonItemStyle.Plain, target: self, action: Selector(PhotosViewController.filterFunction))
        
        
        
        let filterButton=UIBarButtonItem(title: "Filter", style: UIBarButtonItemStyle.Plain , target: self, action: #selector(filterFunction))
        self.navigationItem.rightBarButtonItem = filterButton
        self.photosCollectionView.delegate = self
        self.photosCollectionView.dataSource = self
        self.callSearchFunction(true)
        // Do any additional setup after loading the view.
    }
    @objc private func filterFunction(){
        
        if destinationVc == nil{
            destinationVc=self.storyboard?.instantiateViewControllerWithIdentifier("filter_vc") as! FiltersViewController}
        
        destinationVc.giveBackDataTo(self)
        
        showViewController(destinationVc, sender: nil)
    }
    func parametersToaddInSearch(sortParam: String) {
        
        self.sort=sortParam
        self.callSearchFunction(false)
        
    }
    private func callSearchFunction(appendInPreviousPhotos: Bool)
    {
        
        print("*****" + self.sort)
        FlickrService.searchPhotoWithSearchedKey(searchedKey,page:self.page,sortPara: self.sort,handler: {
            
            (photos) in
            if appendInPreviousPhotos==true{
                self.photos+=photos}
            else{
                self.photos=photos
            }
            print("******\(self.photos.count)")
            
        })
        
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let url = NSURL(string: photos[indexPath.row].url)!
        if indexPath.row == Constants.appDefaults.noOfPhotosPerPage - 1{
            
            self.page+=1
            print("*********\(self.page)")
            self.callSearchFunction(true)
            
        }
        //    let cell = photosCollectionView.dequeueReusableCellWithReuseIdentifier(Constants.Cell.cellInCollection, forIndexPath: indexPath) as! ImageDownloaderPhotoCell
        //
        let cell = photosCollectionView.dequeueReusableCellWithReuseIdentifier(Constants.Cell.cellInCollection, forIndexPath: indexPath) as! ImageDownloaderPhotoCell
        cell.imageView.kf_setImageWithURL(url, placeholderImage: placeHolderPhoto)
        return cell
        
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
        let destinationVC = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.IdentifiersForViewController.photoDetailsViewController) as! PhotoDetailsViewController
        destinationVC.photo = self.photos[indexPath.row]
        
        showViewController(destinationVC, sender: nil)
        
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
