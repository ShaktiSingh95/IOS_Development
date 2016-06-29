//
//  MailChimpModel.swift
//  MailChimp
//
//  Created by Shakti Pratap Singh on 28/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//
import Alamofire
import SwiftyJSON
import Foundation
class MailChimpModel{
    static let baseUrl = "https://us13.api.mailchimp.com/2.0/";
    static let apiKey = "47523e6ade1488fe548b19810b1b184e-us13"
    
   class func fetchList(afterFetching: ([List]) -> Void){
        
        Alamofire.request(.POST, baseUrl + "lists/list?apikey=" + apiKey).responseJSON(completionHandler: {response in
            let json = JSON(response.result.value!)
            var list=[List]()
            for subJson in json["data"].array!{
                
                list.append(List(json: subJson))
                
            }
            afterFetching(list)
        })
        
    }
    class func fetchContactsOfList(id:String,afterFetching: [ContactList] -> Void)
    {
        
        Alamofire.request(.POST, baseUrl + "lists/members?apikey=" + apiKey + "&id=" + id).responseJSON(completionHandler: {response in
            let json = JSON(response.result.value!)
            var list=[ContactList]()
            for subJson in json["data"].array!{
                
                list.append(ContactList(json: subJson))
                
            }
            afterFetching(list)
        })
        

        
    }
}