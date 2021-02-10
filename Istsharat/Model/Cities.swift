//
//  Cities.swift
//  Istsharat
//
//  Created by taima on 2/4/21.
//  Copyright © 2021 mac air. All rights reserved.
//


import Foundation
import SwiftyJSON


class Cities : NSObject, NSCoding{

    var success : Bool!
    var cities : [City]!
    var code : Int!
    var message : String!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        success = json["Success"].boolValue
        cities = [City]()
        let citiesArray = json["cities"].arrayValue
        for citiesJson in citiesArray{
            let value = City(fromJson: citiesJson)
            cities.append(value)
        }
        code = json["code"].intValue
        message = json["message"].stringValue
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
        if cities != nil{
            var dictionaryElements = [[String:Any]]()
            for citiesElement in cities {
                dictionaryElements.append(citiesElement.toDictionary())
            }
            dictionary["cities"] = dictionaryElements
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
         success = aDecoder.decodeObject(forKey: "Success") as? Bool
         cities = aDecoder.decodeObject(forKey: "cities") as? [City]
         code = aDecoder.decodeObject(forKey: "code") as? Int
         message = aDecoder.decodeObject(forKey: "message") as? String

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
        if cities != nil{
            aCoder.encode(cities, forKey: "cities")
        }
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }

    }

}





class City : NSObject, NSCoding{

    var cityArName : String!
    var cityId : Int!
    var cityName : String!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        cityArName = json["city_ar_name"].stringValue
        cityId = json["city_id"].intValue
        cityName = json["city_name"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if cityArName != nil{
            dictionary["city_ar_name"] = cityArName
        }
        if cityId != nil{
            dictionary["city_id"] = cityId
        }
        if cityName != nil{
            dictionary["city_name"] = cityName
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         cityArName = aDecoder.decodeObject(forKey: "city_ar_name") as? String
         cityId = aDecoder.decodeObject(forKey: "city_id") as? Int
         cityName = aDecoder.decodeObject(forKey: "city_name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if cityArName != nil{
            aCoder.encode(cityArName, forKey: "city_ar_name")
        }
        if cityId != nil{
            aCoder.encode(cityId, forKey: "city_id")
        }
        if cityName != nil{
            aCoder.encode(cityName, forKey: "city_name")
        }

    }

}
