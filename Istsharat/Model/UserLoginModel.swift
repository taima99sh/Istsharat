//
//  UserModel.swift
//  Istsharat
//
//  Created by taima on 2/7/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import Foundation
import SwiftyJSON


class UserModel : NSObject, NSCoding{

    var success : Bool!
    var code : Int!
    var message : String!
    var token : String!
    var userDetails : UserDetail!
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        success = json["Success"].boolValue
        code = json["code"].intValue
        message = json["message"].stringValue
        token = json["token"].stringValue
        let userDetailsJson = json["user_details"]
        if !userDetailsJson.isEmpty{
            userDetails = UserDetail(fromJson: userDetailsJson)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if success != nil{
            dictionary["Success"] = success
        }
        if code != nil{
            dictionary["code"] = code
        }
        if message != nil{
            dictionary["message"] = message
        }
        if token != nil{
            dictionary["token"] = token
        }
        if userDetails != nil{
            dictionary["user_details"] = userDetails.toDictionary()
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         success = aDecoder.decodeObject(forKey: "Success") as? Bool
         code = aDecoder.decodeObject(forKey: "code") as? Int
         message = aDecoder.decodeObject(forKey: "message") as? String
         token = aDecoder.decodeObject(forKey: "token") as? String
         userDetails = aDecoder.decodeObject(forKey: "user_details") as? UserDetail

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if success != nil{
            aCoder.encode(success, forKey: "Success")
        }
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if token != nil{
            aCoder.encode(token, forKey: "token")
        }
        if userDetails != nil{
            aCoder.encode(userDetails, forKey: "user_details")
        }

    }

}

class UserDetail : NSObject, NSCoding{

    var arName : String!
    var city : Int!
    var createdAt : String!
    var deviceToken : String!
    var email : String!
    var id : Int!
    var latitude : String!
    var location : String!
    var longitude : String!
    var mobile : String!
    var name : String!
    var tel : String!
    var type : Int!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        arName = json["ar_name"].stringValue
        city = json["city"].intValue
        createdAt = json["created_at"].stringValue
        deviceToken = json["device_token"].stringValue
        email = json["email"].stringValue
        id = json["id"].intValue
        latitude = json["latitude"].stringValue
        location = json["location"].stringValue
        longitude = json["longitude"].stringValue
        mobile = json["mobile"].stringValue
        name = json["name"].stringValue
        tel = json["tel"].stringValue
        type = json["type"].intValue
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
        if city != nil{
            dictionary["city"] = city
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if deviceToken != nil{
            dictionary["device_token"] = deviceToken
        }
        if email != nil{
            dictionary["email"] = email
        }
        if id != nil{
            dictionary["id"] = id
        }
        if latitude != nil{
            dictionary["latitude"] = latitude
        }
        if location != nil{
            dictionary["location"] = location
        }
        if longitude != nil{
            dictionary["longitude"] = longitude
        }
        if mobile != nil{
            dictionary["mobile"] = mobile
        }
        if name != nil{
            dictionary["name"] = name
        }
        if tel != nil{
            dictionary["tel"] = tel
        }
        if type != nil{
            dictionary["type"] = type
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
         city = aDecoder.decodeObject(forKey: "city") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         deviceToken = aDecoder.decodeObject(forKey: "device_token") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         latitude = aDecoder.decodeObject(forKey: "latitude") as? String
         location = aDecoder.decodeObject(forKey: "location") as? String
         longitude = aDecoder.decodeObject(forKey: "longitude") as? String
         mobile = aDecoder.decodeObject(forKey: "mobile") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         tel = aDecoder.decodeObject(forKey: "tel") as? String
         type = aDecoder.decodeObject(forKey: "type") as? Int

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
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deviceToken != nil{
            aCoder.encode(deviceToken, forKey: "device_token")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if latitude != nil{
            aCoder.encode(latitude, forKey: "latitude")
        }
        if location != nil{
            aCoder.encode(location, forKey: "location")
        }
        if longitude != nil{
            aCoder.encode(longitude, forKey: "longitude")
        }
        if mobile != nil{
            aCoder.encode(mobile, forKey: "mobile")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if tel != nil{
            aCoder.encode(tel, forKey: "tel")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }

    }

}
