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
    static let baseUrl = "https://us13.api.mailchimp.com/2.0/"
    static let apiKey = "802569b19c7638c94fa59c39c79f9927-us13"
    //    struct email {
    //
    //        var email: String
    //
    //    }
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
    class func fetchExistingCampaigns(listId:String){
        
        let para:[String:AnyObject] = ["apikey":apiKey,"filters":["list_id":listId]]
        Alamofire.request(.POST, baseUrl + "campaigns/list?", parameters: para).responseJSON{response in print()
            
        }
        
    }
    class func createCampaign(listId:String,subject:String,fromEmail:String,fromName:String,toName:String,message:String,handler: Void -> Void){
        let para:[String : AnyObject] = ["apikey":apiKey,"type":"plaintext","options":["list_id":listId,"subject":subject,"from_email":fromEmail,"from_name":fromName,"to_name":toName],"content":["test":message]]
        Alamofire.request(.POST, baseUrl + "campaigns/create?", parameters: para).responseJSON{
        response in
            handler()
        
        }
        
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
    class func addContact(id: String,email: String,fName:String,lName:String,handler: Void -> Void){
        
        //var mail = email(email: "shakti.14bcs1100@abes.ac.in")
        let para: [String: AnyObject] = ["apikey" : apiKey,"id" : id,"email" : ["email" : email],"merge_vars": ["FNAME":fName,"LNAME":lName],"double_optin":false]
        Alamofire.request(.POST, baseUrl + "lists/subscribe?", parameters: para)
        .responseJSON{Response in
            let json = JSON(Response.result.value!)
            
            handler()
            
        }
        
    }
    class func deleteContactFromList(id:String,emailAdd:String,handler: Void->Void){
    
        let para: [String: AnyObject] = [ "apikey":apiKey,"id":id,"email":["email":emailAdd],"delete_member": true,"send_goodbye":true ]
        Alamofire.request(.POST, baseUrl + "lists/unsubscribe?", parameters: para)
            .responseJSON{Response in
            let json = JSON(Response.result.value!)
            
                handler()
        
        }
    }
}