//
//  ChatSessionsModel.swift
//  Istsharat
//
//  Created by taima on 2/7/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import Foundation
import SwiftyJSON


class ChatSessionsModel : NSObject, NSCoding{

    var chatSessions : [ChatSession]!
    var success : Bool!
    var code : Int!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        chatSessions = [ChatSession]()
        let chatSessionsArray = json["Chat_Sessions"].arrayValue
        for chatSessionsJson in chatSessionsArray{
            let value = ChatSession(fromJson: chatSessionsJson)
            chatSessions.append(value)
        }
        success = json["Success"].boolValue
        code = json["code"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if chatSessions != nil{
            var dictionaryElements = [[String:Any]]()
            for chatSessionsElement in chatSessions {
                dictionaryElements.append(chatSessionsElement.toDictionary())
            }
            dictionary["Chat_Sessions"] = dictionaryElements
        }
        if success != nil{
            dictionary["Success"] = success
        }
        if code != nil{
            dictionary["code"] = code
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         chatSessions = aDecoder.decodeObject(forKey: "Chat_Sessions") as? [ChatSession]
         success = aDecoder.decodeObject(forKey: "Success") as? Bool
         code = aDecoder.decodeObject(forKey: "code") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if chatSessions != nil{
            aCoder.encode(chatSessions, forKey: "Chat_Sessions")
        }
        if success != nil{
            aCoder.encode(success, forKey: "Success")
        }
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }

    }

}

class ChatSession : NSObject, NSCoding{

    var category : String!
    var chatId : Int!
    var createdAt : String!
    var customerId : Int!
    var deleted : Int!
    var locked : Int!
    var status : Int!
    var unread : Int!
    var updatedAt : AnyObject!
    var userId : Int!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        category = json["category"].stringValue
        chatId = json["chat_id"].intValue
        createdAt = json["created_at"].stringValue
        customerId = json["customer_id"].intValue
        deleted = json["deleted"].intValue
        locked = json["locked"].intValue
        status = json["status"].intValue
        unread = json["unread"].intValue
        updatedAt = json["updated_at"].stringValue as AnyObject
        userId = json["user_id"].intValue
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
        if chatId != nil{
            dictionary["chat_id"] = chatId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if customerId != nil{
            dictionary["customer_id"] = customerId
        }
        if deleted != nil{
            dictionary["deleted"] = deleted
        }
        if locked != nil{
            dictionary["locked"] = locked
        }
        if status != nil{
            dictionary["status"] = status
        }
        if unread != nil{
            dictionary["unread"] = unread
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         category = aDecoder.decodeObject(forKey: "category") as? String
         chatId = aDecoder.decodeObject(forKey: "chat_id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         customerId = aDecoder.decodeObject(forKey: "customer_id") as? Int
         deleted = aDecoder.decodeObject(forKey: "deleted") as? Int
         locked = aDecoder.decodeObject(forKey: "locked") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         unread = aDecoder.decodeObject(forKey: "unread") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? AnyObject
         userId = aDecoder.decodeObject(forKey: "user_id") as? Int

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
        if chatId != nil{
            aCoder.encode(chatId, forKey: "chat_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if customerId != nil{
            aCoder.encode(customerId, forKey: "customer_id")
        }
        if deleted != nil{
            aCoder.encode(deleted, forKey: "deleted")
        }
        if locked != nil{
            aCoder.encode(locked, forKey: "locked")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if unread != nil{
            aCoder.encode(unread, forKey: "unread")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }

    }

}


class ListMessagesModel : NSObject, NSCoding{

    var messages : [Message]!
    var success : Bool!
    var code : Int!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        messages = [Message]()
        let messagesArray = json["Messages"].arrayValue
        for messagesJson in messagesArray{
            let value = Message(fromJson: messagesJson)
            messages.append(value)
        }
        success = json["Success"].boolValue
        code = json["code"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if messages != nil{
            var dictionaryElements = [[String:Any]]()
            for messagesElement in messages {
                dictionaryElements.append(messagesElement.toDictionary())
            }
            dictionary["Messages"] = dictionaryElements
        }
        if success != nil{
            dictionary["Success"] = success
        }
        if code != nil{
            dictionary["code"] = code
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         messages = aDecoder.decodeObject(forKey: "Messages") as? [Message]
         success = aDecoder.decodeObject(forKey: "Success") as? Bool
         code = aDecoder.decodeObject(forKey: "code") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if messages != nil{
            aCoder.encode(messages, forKey: "Messages")
        }
        if success != nil{
            aCoder.encode(success, forKey: "Success")
        }
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }

    }

}


class Message : NSObject, NSCoding{

    var chatId : Int!
    var createdAt : String!
    var filePath : String!
    var message : String!
    var msgId : Int!
    var senderId : Int!
    var senderType : Int!
    var status : Int!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        chatId = json["chat_id"].intValue
        createdAt = json["created_at"].stringValue
        filePath = json["file_path"].stringValue
        message = json["message"].stringValue
        msgId = json["msg_id"].intValue
        senderId = json["sender_id"].intValue
        senderType = json["sender_type"].intValue
        status = json["status"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if chatId != nil{
            dictionary["chat_id"] = chatId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if filePath != nil{
            dictionary["file_path"] = filePath
        }
        if message != nil{
            dictionary["message"] = message
        }
        if msgId != nil{
            dictionary["msg_id"] = msgId
        }
        if senderId != nil{
            dictionary["sender_id"] = senderId
        }
        if senderType != nil{
            dictionary["sender_type"] = senderType
        }
        if status != nil{
            dictionary["status"] = status
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         chatId = aDecoder.decodeObject(forKey: "chat_id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         filePath = aDecoder.decodeObject(forKey: "file_path") as? String
         message = aDecoder.decodeObject(forKey: "message") as? String
         msgId = aDecoder.decodeObject(forKey: "msg_id") as? Int
         senderId = aDecoder.decodeObject(forKey: "sender_id") as? Int
         senderType = aDecoder.decodeObject(forKey: "sender_type") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if chatId != nil{
            aCoder.encode(chatId, forKey: "chat_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if filePath != nil{
            aCoder.encode(filePath, forKey: "file_path")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if msgId != nil{
            aCoder.encode(msgId, forKey: "msg_id")
        }
        if senderId != nil{
            aCoder.encode(senderId, forKey: "sender_id")
        }
        if senderType != nil{
            aCoder.encode(senderType, forKey: "sender_type")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }

    }

}
