//
//  Story.swift
//  NewsApp
//
//  Created by Shakti Pratap Singh on 13/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class Story{
    
    var id: Int!
    var title: String!
    var description: String!
    var articleLink: String!
    var imageUrl: String!
    init(story:JSON){
        
        self.id = story["id"].int
        self.title = story["title"].string
        self.description = story["description"].string
        self.articleLink = story["article_link"].string
        self.imageUrl = story["thumbnail_url"].string
        
    }
    
}