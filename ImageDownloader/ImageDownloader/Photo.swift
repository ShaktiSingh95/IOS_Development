//
//  Photo.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 03/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class Photo{
    
    var url: String
    var title: String
    init(json: JSON)
    {
        
        self.url="https://farm\(json["farm"].int!).staticflickr.com/\(json["server"].string!)/\(json["id"].string!)_\(json["secret"].string!)_n.jpg"
        self.title=json["title"].string!
        
    }
}