//
//  NewsModel.swift
//  NewsApp
//
//  Created by Shakti Pratap Singh on 13/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class NewsModel{
    
    class func getCategories(handler: [Categories]->Void){
        
        var categories = [Categories]()
        Alamofire.request(.GET, "http://news.vaetas.com/categories").responseJSON{
            
            response in
            let json = JSON(response.result.value!)
            for (_,subJson):(String,JSON) in json{
                
                categories.append(Categories(json: subJson))
                
            }
            handler(categories)
            
        }
    }
    
    class func getStories(page:Int,handler: [Story]->Void){
        
        var stories = [Story]()
        let parameter = ["page":page]
//        
//        Alamofire.request(.GET,"http://news.vaetas.com/stories?" , parameters: parameter).responseJSON{
        Alamofire.request(.GET, "http://news.vaetas.com/stories?", parameters: parameter).responseJSON{
        response in
            print(response)
            var json = JSON(response.result.value!)
        
        json = json["data"]
            for (_,subJson):(String,JSON) in json{
                
                stories.append(Story(story: subJson))
                
            }
            handler(stories)
        
        }
        
        
            
            
        }
    }
