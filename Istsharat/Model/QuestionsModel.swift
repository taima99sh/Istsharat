//
//  QuestionsModel.swift
//  Istsharat
//
//  Created by taima on 2/7/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import Foundation
import SwiftyJSON


class QuestionsModel : NSObject, NSCoding{

    var questions : [Question]!
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
        questions = [Question]()
        let questionsArray = json["Questions"].arrayValue
        for questionsJson in questionsArray{
            let value = Question(fromJson: questionsJson)
            questions.append(value)
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
        if questions != nil{
            var dictionaryElements = [[String:Any]]()
            for questionsElement in questions {
                dictionaryElements.append(questionsElement.toDictionary())
            }
            dictionary["Questions"] = dictionaryElements
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
         questions = aDecoder.decodeObject(forKey: "Questions") as? [Question]
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
        if questions != nil{
            aCoder.encode(questions, forKey: "Questions")
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

class Question : NSObject, NSCoding{

    var category : Int!
    var createdAt : String!
    var deleted : Int!
    var descriptionField : String!
    var id : Int!
    var isPublic : Int!
    var repliedAt : AnyObject!
    var repliedBy : AnyObject!
    var replyDescription : String!
    var replyTitle : String!
    var status : Int!
    var title : String!
    var uId : Int!
    var updatedAt : AnyObject!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        category = json["category"].intValue
        createdAt = json["created_at"].stringValue
        deleted = json["deleted"].intValue
        descriptionField = json["description"].stringValue
        id = json["id"].intValue
        isPublic = json["is_public"].intValue
        repliedAt = json["replied_at"].stringValue as AnyObject
        repliedBy = json["replied_by"].stringValue as AnyObject
        replyDescription = json["reply_description"].stringValue
        replyTitle = json["reply_title"].stringValue
        status = json["status"].intValue
        title = json["title"].stringValue
        uId = json["u_id"].intValue
        updatedAt = json["updated_at"].stringValue as AnyObject
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if category != nil{
            dictionary["category"] = category
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if deleted != nil{
            dictionary["deleted"] = deleted
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isPublic != nil{
            dictionary["is_public"] = isPublic
        }
        if repliedAt != nil{
            dictionary["replied_at"] = repliedAt
        }
        if repliedBy != nil{
            dictionary["replied_by"] = repliedBy
        }
        if replyDescription != nil{
            dictionary["reply_description"] = replyDescription
        }
        if replyTitle != nil{
            dictionary["reply_title"] = replyTitle
        }
        if status != nil{
            dictionary["status"] = status
        }
        if title != nil{
            dictionary["title"] = title
        }
        if uId != nil{
            dictionary["u_id"] = uId
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
         category = aDecoder.decodeObject(forKey: "category") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         deleted = aDecoder.decodeObject(forKey: "deleted") as? Int
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isPublic = aDecoder.decodeObject(forKey: "is_public") as? Int
         repliedAt = aDecoder.decodeObject(forKey: "replied_at") as? AnyObject
         repliedBy = aDecoder.decodeObject(forKey: "replied_by") as? AnyObject
         replyDescription = aDecoder.decodeObject(forKey: "reply_description") as? String
         replyTitle = aDecoder.decodeObject(forKey: "reply_title") as? String
         status = aDecoder.decodeObject(forKey: "status") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String
         uId = aDecoder.decodeObject(forKey: "u_id") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? AnyObject

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if category != nil{
            aCoder.encode(category, forKey: "category")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deleted != nil{
            aCoder.encode(deleted, forKey: "deleted")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isPublic != nil{
            aCoder.encode(isPublic, forKey: "is_public")
        }
        if repliedAt != nil{
            aCoder.encode(repliedAt, forKey: "replied_at")
        }
        if repliedBy != nil{
            aCoder.encode(repliedBy, forKey: "replied_by")
        }
        if replyDescription != nil{
            aCoder.encode(replyDescription, forKey: "reply_description")
        }
        if replyTitle != nil{
            aCoder.encode(replyTitle, forKey: "reply_title")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if uId != nil{
            aCoder.encode(uId, forKey: "u_id")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}



class QuestionsDetails : NSObject, NSCoding{

    var details : QDetail!
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
        let detailsJson = json["Details"]
        if !detailsJson.isEmpty{
            details = QDetail(fromJson: detailsJson)
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
        if details != nil{
            dictionary["Details"] = details.toDictionary()
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
         details = aDecoder.decodeObject(forKey: "Details") as? QDetail
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
        if details != nil{
            aCoder.encode(details, forKey: "Details")
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

class QDetail : NSObject, NSCoding{

    var arName : String!
    var cArName : AnyObject!
    var cName : AnyObject!
    var category : Int!
    var createdAt : String!
    var deleted : Int!
    var descriptionField : String!
    var email : String!
    var id : Int!
    var isPublic : Int!
    var mobile : String!
    var name : String!
    var repliedAt : AnyObject!
    var repliedBy : AnyObject!
    var replyDescription : String!
    var replyTitle : String!
    var status : Int!
    var title : String!
    var uId : Int!
    var updatedAt : AnyObject!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        arName = json["ar_name"].stringValue
        cArName = json["c_ar_name"].stringValue as AnyObject
        cName = json["c_name"].stringValue as AnyObject
        category = json["category"].intValue
        createdAt = json["created_at"].stringValue
        deleted = json["deleted"].intValue
        descriptionField = json["description"].stringValue
        email = json["email"].stringValue
        id = json["id"].intValue
        isPublic = json["is_public"].intValue
        mobile = json["mobile"].stringValue
        name = json["name"].stringValue
        repliedAt = json["replied_at"].stringValue as AnyObject
        repliedBy = json["replied_by"].stringValue as AnyObject
        replyDescription = json["reply_description"].stringValue
        replyTitle = json["reply_title"].stringValue
        status = json["status"].intValue
        title = json["title"].stringValue
        uId = json["u_id"].intValue
        updatedAt = json["updated_at"].stringValue as AnyObject
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if arName != nil{
            dictionary["ar_name"] = arName
        }
        if cArName != nil{
            dictionary["c_ar_name"] = cArName
        }
        if cName != nil{
            dictionary["c_name"] = cName
        }
        if category != nil{
            dictionary["category"] = category
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if deleted != nil{
            dictionary["deleted"] = deleted
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if email != nil{
            dictionary["email"] = email
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isPublic != nil{
            dictionary["is_public"] = isPublic
        }
        if mobile != nil{
            dictionary["mobile"] = mobile
        }
        if name != nil{
            dictionary["name"] = name
        }
        if repliedAt != nil{
            dictionary["replied_at"] = repliedAt
        }
        if repliedBy != nil{
            dictionary["replied_by"] = repliedBy
        }
        if replyDescription != nil{
            dictionary["reply_description"] = replyDescription
        }
        if replyTitle != nil{
            dictionary["reply_title"] = replyTitle
        }
        if status != nil{
            dictionary["status"] = status
        }
        if title != nil{
            dictionary["title"] = title
        }
        if uId != nil{
            dictionary["u_id"] = uId
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
         arName = aDecoder.decodeObject(forKey: "ar_name") as? String
         cArName = aDecoder.decodeObject(forKey: "c_ar_name") as? AnyObject
         cName = aDecoder.decodeObject(forKey: "c_name") as? AnyObject
         category = aDecoder.decodeObject(forKey: "category") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         deleted = aDecoder.decodeObject(forKey: "deleted") as? Int
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isPublic = aDecoder.decodeObject(forKey: "is_public") as? Int
         mobile = aDecoder.decodeObject(forKey: "mobile") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         repliedAt = aDecoder.decodeObject(forKey: "replied_at") as? AnyObject
         repliedBy = aDecoder.decodeObject(forKey: "replied_by") as? AnyObject
         replyDescription = aDecoder.decodeObject(forKey: "reply_description") as? String
         replyTitle = aDecoder.decodeObject(forKey: "reply_title") as? String
         status = aDecoder.decodeObject(forKey: "status") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String
         uId = aDecoder.decodeObject(forKey: "u_id") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? AnyObject

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if arName != nil{
            aCoder.encode(arName, forKey: "ar_name")
        }
        if cArName != nil{
            aCoder.encode(cArName, forKey: "c_ar_name")
        }
        if cName != nil{
            aCoder.encode(cName, forKey: "c_name")
        }
        if category != nil{
            aCoder.encode(category, forKey: "category")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deleted != nil{
            aCoder.encode(deleted, forKey: "deleted")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isPublic != nil{
            aCoder.encode(isPublic, forKey: "is_public")
        }
        if mobile != nil{
            aCoder.encode(mobile, forKey: "mobile")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if repliedAt != nil{
            aCoder.encode(repliedAt, forKey: "replied_at")
        }
        if repliedBy != nil{
            aCoder.encode(repliedBy, forKey: "replied_by")
        }
        if replyDescription != nil{
            aCoder.encode(replyDescription, forKey: "reply_description")
        }
        if replyTitle != nil{
            aCoder.encode(replyTitle, forKey: "reply_title")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if uId != nil{
            aCoder.encode(uId, forKey: "u_id")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}
