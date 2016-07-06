//
//  FlickrService.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 03/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher
import SwiftyJSON

class FlickrService{
    
    class func searchPhotoWithSearchedKey(searchedKey:String,page:Int,sortPara:String,handler: [Photo]->Void){
        
        
        var para:[String:AnyObject]=["method":Constants.Flickr.Url.searchMethod,"sort":sortPara,"text":searchedKey,"page":page]
        request(.GET,parameter: para,handler: {
            
            (json) in
            print(json)
            var photos = [Photo]()
            for (_,photo):(String,JSON) in json["photos"]["photo"]{
                
                photos.append(Photo(json: photo))
                
            }
            handler(photos)
            
        })

    }
    class func request(method: Alamofire.Method,parameter: [String:AnyObject],handler: JSON->Void){
        
        var allParam:[String:AnyObject] = ["api_key":Constants.Flickr.apiKey,"format":Constants.Flickr.responseFormat,"nojsoncallback": Constants.Flickr.jsonCallback]
        allParam.union(parameter)
        Alamofire.request(method, Constants.Flickr.Url.baseUrl, parameters: allParam).responseJSON{
            
            response in handler(JSON(response.result.value!))
            
        }
}
}