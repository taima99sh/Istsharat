//
//  Home.swift
//  Istsharat
//
//  Created by taima on 2/6/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import Foundation
import SwiftyJSON


class HomeModel : NSObject, NSCoding{

    var categories : [CategoryHome]!
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
        categories = [CategoryHome]()
        let categoriesArray = json["Categories"].arrayValue
        for categoriesJson in categoriesArray{
            let value = CategoryHome(fromJson: categoriesJson)
            categories.append(value)
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
        if categories != nil{
            var dictionaryElements = [[String:Any]]()
            for categoriesElement in categories {
                dictionaryElements.append(categoriesElement.toDictionary())
            }
            dictionary["Categories"] = dictionaryElements
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
         categories = aDecoder.decodeObject(forKey: "Categories") as? [CategoryHome]
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
        if categories != nil{
            aCoder.encode(categories, forKey: "Categories")
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

class CategoryHome : NSObject, NSCoding{

    var topics : [Topic]!
    var cActive : Int!
    var cAddedBy : Int!
    var cArDescription : String!
    var cArName : String!
    var cArTemplate : Int!
    var cDeleted : Int!
    var cDescription : String!
    var cEditable : Int!
    var cEditedBy : Int!
    var cId : Int!
    var cItemsperpage : Int!
    var cLang : Int!
    var cName : String!
    var cParent : Int!
    var cPriority : Int!
    var cShowcatlist : Int!
    var cShowdate : Int!
    var cShowdescription : Int!
    var cShowinpath : Int!
    var cShowthumb : Int!
    var cShowtitle : Int!
    var cTemplate : Int!
    var cThumb : String!
    var cType : Int!
    var cViewOption : Int!
    var createdAt : String!
    var name : String!
    var uFullname : String!
    var uLoginname : String!
    var updatedAt : String!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        topics = [Topic]()
        let topicsArray = json["Topics"].arrayValue
        for topicsJson in topicsArray{
            let value = Topic(fromJson: topicsJson)
            topics.append(value)
        }
        cActive = json["c_active"].intValue
        cAddedBy = json["c_added_by"].intValue
        cArDescription = json["c_ar_description"].stringValue
        cArName = json["c_ar_name"].stringValue
        cArTemplate = json["c_ar_template"].intValue
        cDeleted = json["c_deleted"].intValue
        cDescription = json["c_description"].stringValue
        cEditable = json["c_editable"].intValue
        cEditedBy = json["c_edited_by"].intValue
        cId = json["c_id"].intValue
        cItemsperpage = json["c_itemsperpage"].intValue
        cLang = json["c_lang"].intValue
        cName = json["c_name"].stringValue
        cParent = json["c_parent"].intValue
        cPriority = json["c_priority"].intValue
        cShowcatlist = json["c_showcatlist"].intValue
        cShowdate = json["c_showdate"].intValue
        cShowdescription = json["c_showdescription"].intValue
        cShowinpath = json["c_showinpath"].intValue
        cShowthumb = json["c_showthumb"].intValue
        cShowtitle = json["c_showtitle"].intValue
        cTemplate = json["c_template"].intValue
        cThumb = json["c_thumb"].stringValue
        cType = json["c_type"].intValue
        cViewOption = json["c_view_option"].intValue
        createdAt = json["created_at"].stringValue
        name = json["name"].stringValue
        uFullname = json["u_fullname"].stringValue
        uLoginname = json["u_loginname"].stringValue
        updatedAt = json["updated_at"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if topics != nil{
            var dictionaryElements = [[String:Any]]()
            for topicsElement in topics {
                dictionaryElements.append(topicsElement.toDictionary())
            }
            dictionary["Topics"] = dictionaryElements
        }
        if cActive != nil{
            dictionary["c_active"] = cActive
        }
        if cAddedBy != nil{
            dictionary["c_added_by"] = cAddedBy
        }
        if cArDescription != nil{
            dictionary["c_ar_description"] = cArDescription
        }
        if cArName != nil{
            dictionary["c_ar_name"] = cArName
        }
        if cArTemplate != nil{
            dictionary["c_ar_template"] = cArTemplate
        }
        if cDeleted != nil{
            dictionary["c_deleted"] = cDeleted
        }
        if cDescription != nil{
            dictionary["c_description"] = cDescription
        }
        if cEditable != nil{
            dictionary["c_editable"] = cEditable
        }
        if cEditedBy != nil{
            dictionary["c_edited_by"] = cEditedBy
        }
        if cId != nil{
            dictionary["c_id"] = cId
        }
        if cItemsperpage != nil{
            dictionary["c_itemsperpage"] = cItemsperpage
        }
        if cLang != nil{
            dictionary["c_lang"] = cLang
        }
        if cName != nil{
            dictionary["c_name"] = cName
        }
        if cParent != nil{
            dictionary["c_parent"] = cParent
        }
        if cPriority != nil{
            dictionary["c_priority"] = cPriority
        }
        if cShowcatlist != nil{
            dictionary["c_showcatlist"] = cShowcatlist
        }
        if cShowdate != nil{
            dictionary["c_showdate"] = cShowdate
        }
        if cShowdescription != nil{
            dictionary["c_showdescription"] = cShowdescription
        }
        if cShowinpath != nil{
            dictionary["c_showinpath"] = cShowinpath
        }
        if cShowthumb != nil{
            dictionary["c_showthumb"] = cShowthumb
        }
        if cShowtitle != nil{
            dictionary["c_showtitle"] = cShowtitle
        }
        if cTemplate != nil{
            dictionary["c_template"] = cTemplate
        }
        if cThumb != nil{
            dictionary["c_thumb"] = cThumb
        }
        if cType != nil{
            dictionary["c_type"] = cType
        }
        if cViewOption != nil{
            dictionary["c_view_option"] = cViewOption
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if name != nil{
            dictionary["name"] = name
        }
        if uFullname != nil{
            dictionary["u_fullname"] = uFullname
        }
        if uLoginname != nil{
            dictionary["u_loginname"] = uLoginname
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         topics = aDecoder.decodeObject(forKey: "Topics") as? [Topic]
         cActive = aDecoder.decodeObject(forKey: "c_active") as? Int
         cAddedBy = aDecoder.decodeObject(forKey: "c_added_by") as? Int
         cArDescription = aDecoder.decodeObject(forKey: "c_ar_description") as? String
         cArName = aDecoder.decodeObject(forKey: "c_ar_name") as? String
         cArTemplate = aDecoder.decodeObject(forKey: "c_ar_template") as? Int
         cDeleted = aDecoder.decodeObject(forKey: "c_deleted") as? Int
         cDescription = aDecoder.decodeObject(forKey: "c_description") as? String
         cEditable = aDecoder.decodeObject(forKey: "c_editable") as? Int
         cEditedBy = aDecoder.decodeObject(forKey: "c_edited_by") as? Int
         cId = aDecoder.decodeObject(forKey: "c_id") as? Int
         cItemsperpage = aDecoder.decodeObject(forKey: "c_itemsperpage") as? Int
         cLang = aDecoder.decodeObject(forKey: "c_lang") as? Int
         cName = aDecoder.decodeObject(forKey: "c_name") as? String
         cParent = aDecoder.decodeObject(forKey: "c_parent") as? Int
         cPriority = aDecoder.decodeObject(forKey: "c_priority") as? Int
         cShowcatlist = aDecoder.decodeObject(forKey: "c_showcatlist") as? Int
         cShowdate = aDecoder.decodeObject(forKey: "c_showdate") as? Int
         cShowdescription = aDecoder.decodeObject(forKey: "c_showdescription") as? Int
         cShowinpath = aDecoder.decodeObject(forKey: "c_showinpath") as? Int
         cShowthumb = aDecoder.decodeObject(forKey: "c_showthumb") as? Int
         cShowtitle = aDecoder.decodeObject(forKey: "c_showtitle") as? Int
         cTemplate = aDecoder.decodeObject(forKey: "c_template") as? Int
         cThumb = aDecoder.decodeObject(forKey: "c_thumb") as? String
         cType = aDecoder.decodeObject(forKey: "c_type") as? Int
         cViewOption = aDecoder.decodeObject(forKey: "c_view_option") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         uFullname = aDecoder.decodeObject(forKey: "u_fullname") as? String
         uLoginname = aDecoder.decodeObject(forKey: "u_loginname") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if topics != nil{
            aCoder.encode(topics, forKey: "Topics")
        }
        if cActive != nil{
            aCoder.encode(cActive, forKey: "c_active")
        }
        if cAddedBy != nil{
            aCoder.encode(cAddedBy, forKey: "c_added_by")
        }
        if cArDescription != nil{
            aCoder.encode(cArDescription, forKey: "c_ar_description")
        }
        if cArName != nil{
            aCoder.encode(cArName, forKey: "c_ar_name")
        }
        if cArTemplate != nil{
            aCoder.encode(cArTemplate, forKey: "c_ar_template")
        }
        if cDeleted != nil{
            aCoder.encode(cDeleted, forKey: "c_deleted")
        }
        if cDescription != nil{
            aCoder.encode(cDescription, forKey: "c_description")
        }
        if cEditable != nil{
            aCoder.encode(cEditable, forKey: "c_editable")
        }
        if cEditedBy != nil{
            aCoder.encode(cEditedBy, forKey: "c_edited_by")
        }
        if cId != nil{
            aCoder.encode(cId, forKey: "c_id")
        }
        if cItemsperpage != nil{
            aCoder.encode(cItemsperpage, forKey: "c_itemsperpage")
        }
        if cLang != nil{
            aCoder.encode(cLang, forKey: "c_lang")
        }
        if cName != nil{
            aCoder.encode(cName, forKey: "c_name")
        }
        if cParent != nil{
            aCoder.encode(cParent, forKey: "c_parent")
        }
        if cPriority != nil{
            aCoder.encode(cPriority, forKey: "c_priority")
        }
        if cShowcatlist != nil{
            aCoder.encode(cShowcatlist, forKey: "c_showcatlist")
        }
        if cShowdate != nil{
            aCoder.encode(cShowdate, forKey: "c_showdate")
        }
        if cShowdescription != nil{
            aCoder.encode(cShowdescription, forKey: "c_showdescription")
        }
        if cShowinpath != nil{
            aCoder.encode(cShowinpath, forKey: "c_showinpath")
        }
        if cShowthumb != nil{
            aCoder.encode(cShowthumb, forKey: "c_showthumb")
        }
        if cShowtitle != nil{
            aCoder.encode(cShowtitle, forKey: "c_showtitle")
        }
        if cTemplate != nil{
            aCoder.encode(cTemplate, forKey: "c_template")
        }
        if cThumb != nil{
            aCoder.encode(cThumb, forKey: "c_thumb")
        }
        if cType != nil{
            aCoder.encode(cType, forKey: "c_type")
        }
        if cViewOption != nil{
            aCoder.encode(cViewOption, forKey: "c_view_option")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if uFullname != nil{
            aCoder.encode(uFullname, forKey: "u_fullname")
        }
        if uLoginname != nil{
            aCoder.encode(uLoginname, forKey: "u_loginname")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}

class Topic : NSObject, NSCoding{

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



