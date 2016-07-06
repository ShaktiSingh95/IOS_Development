//
//  Constants.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 03/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
struct Constants {
    struct IdentifiersForViewController{
        
        static let photosViewControllerIdentifier = "photos_vc"
        static let photoDetailsViewController = "photo_details_vc"
        
    }
    struct Flickr {
        static let apiKey = "d96d1f8c08d275030cb0083eb7501172"
        static let responseFormat = "json"
        static let jsonCallback = 1
        static let privacyFilter = 1
        
        struct Url {
            
            static let baseUrl = "https://api.flickr.com/services/rest/"
            static let searchMethod = "flickr.photos.search"
            
        }
        
    }
    struct Filter{
    
    static let defaultFilter = "interestingness-desc"
    static let filterOptions=["relevance","date-posted-desc","date-posted-asc","interestingness-desc"]
    
    }
    struct appDefaults {
        static let noOfPhotosPerPage = 100
    }
    struct Images {
      static let  placeHolderPhoto = "PlaceholderPhoto"
    }
    struct Cell {
        
        static let cellInCollection = "photo_thumb"
        static let cellInFilterTableView = "filter_cell"
        
    }
    
}