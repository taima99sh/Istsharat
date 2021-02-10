//
//  PageOfCategory.swift
//  Istsharat
//
//  Created by taima on 2/4/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import Foundation
import SwiftyJSON


class PageOfCategory : NSObject, NSCoding{

    var pages : [Page]!
    var success : Bool!
    var code : Int!
    var message : String!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        pages = [Page]()
        let pagesArray = json["Pages"].arrayValue
        for pagesJson in pagesArray{
            let value = Page(fromJson: pagesJson)
            pages.append(value)
        }
        success = json["Success"].boolValue
        code = json["code"].intValue
        message = json["message"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if pages != nil{
            var dictionaryElements = [[String:Any]]()
            for pagesElement in pages {
                dictionaryElements.append(pagesElement.toDictionary())
            }
            dictionary["Pages"] = dictionaryElements
        }
        if success != nil{
            dictionary["Success"] = success
        }
        if code != nil{
            dictionary["code"] = code
        }
        if message != nil{
            dictionary["message"] = message
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         pages = aDecoder.decodeObject(forKey: "Pages") as? [Page]
         success = aDecoder.decodeObject(forKey: "Success") as? Bool
         code = aDecoder.decodeObject(forKey: "code") as? Int
         message = aDecoder.decodeObject(forKey: "message") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if pages != nil{
            aCoder.encode(pages, forKey: "Pages")
        }
        if success != nil{
            aCoder.encode(success, forKey: "Success")
        }
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }

    }

}



class Page : NSObject, NSCoding{

    var pBody : String!
    var pId : Int!
    var pLang : Int!
    var pSubtitle : String!
    var pSummary : String!
    var pThumb : String!
    var pTitle : String!
    var pUrl : String!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        pBody = json["p_body"].stringValue
        pId = json["p_id"].intValue
        pLang = json["p_lang"].intValue
        pSubtitle = json["p_subtitle"].stringValue
        pSummary = json["p_summary"].stringValue
        pThumb = json["p_thumb"].stringValue
        pTitle = json["p_title"].stringValue
        pUrl = json["p_url"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if pBody != nil{
            dictionary["p_body"] = pBody
        }
        if pId != nil{
            dictionary["p_id"] = pId
        }
        if pLang != nil{
            dictionary["p_lang"] = pLang
        }
        if pSubtitle != nil{
            dictionary["p_subtitle"] = pSubtitle
        }
        if pSummary != nil{
            dictionary["p_summary"] = pSummary
        }
        if pThumb != nil{
            dictionary["p_thumb"] = pThumb
        }
        if pTitle != nil{
            dictionary["p_title"] = pTitle
        }
        if pUrl != nil{
            dictionary["p_url"] = pUrl
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         pBody = aDecoder.decodeObject(forKey: "p_body") as? String
         pId = aDecoder.decodeObject(forKey: "p_id") as? Int
         pLang = aDecoder.decodeObject(forKey: "p_lang") as? Int
         pSubtitle = aDecoder.decodeObject(forKey: "p_subtitle") as? String
         pSummary = aDecoder.decodeObject(forKey: "p_summary") as? String
         pThumb = aDecoder.decodeObject(forKey: "p_thumb") as? String
         pTitle = aDecoder.decodeObject(forKey: "p_title") as? String
         pUrl = aDecoder.decodeObject(forKey: "p_url") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if pBody != nil{
            aCoder.encode(pBody, forKey: "p_body")
        }
        if pId != nil{
            aCoder.encode(pId, forKey: "p_id")
        }
        if pLang != nil{
            aCoder.encode(pLang, forKey: "p_lang")
        }
        if pSubtitle != nil{
            aCoder.encode(pSubtitle, forKey: "p_subtitle")
        }
        if pSummary != nil{
            aCoder.encode(pSummary, forKey: "p_summary")
        }
        if pThumb != nil{
            aCoder.encode(pThumb, forKey: "p_thumb")
        }
        if pTitle != nil{
            aCoder.encode(pTitle, forKey: "p_title")
        }
        if pUrl != nil{
            aCoder.encode(pUrl, forKey: "p_url")
        }

    }

}





