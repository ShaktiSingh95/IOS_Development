//
//  Categories.swift
//  NewsApp
//
//  Created by Shakti Pratap Singh on 13/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class Categories{
    
    var id:Int?
    var title:String?
    
    init(json: JSON){
        
       self.id = json["id"].int
        self.title = json["title"].string
        
    }
    
}