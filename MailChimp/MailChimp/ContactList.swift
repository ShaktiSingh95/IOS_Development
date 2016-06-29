//
//  ContactList.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 29/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class ContactList{
    
    var name: String!
    var emailAdd: String!
    init(json: JSON){
        self.name=json["merges"]["FNAME"].string! + " " + json["merges"]["LNAME"].string!
        self.emailAdd=json["merges"]["EMAIL"].string!
        
    }
    
}