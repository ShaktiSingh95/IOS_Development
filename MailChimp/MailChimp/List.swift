//
//  List.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 28/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class List{
    
    var name:String!
    var id:String!
    init(json: JSON){
        
        self.id=json["id"].string!
        self.name=json["name"].string!
        
    }
    
}