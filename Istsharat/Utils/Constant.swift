//
//  File.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import Foundation
import  UIKit
import SwiftyJSON

class Constant {
    static let shared = Constant()
    var categories: [Category] = []
    var ProjectFont = "Helvetica Neue W23 for SKY"
    
    
    enum MenuItems {
        case home
        case categories
        case chat
        case search
        case addresses
        case consultations
        case profile
        case SignOut
        
        var name:String {
            switch self {
            
            case .home:
                return  "الصفحة الرئيسية "
            case .categories:
              return  "التصنيفات"
            case .chat:
              return  "محادثة"
            case .search:
              return "بحث متقدم"
            case .addresses:
              return "عناويين تلقي الخدمات"
            case .consultations:
              return "الاستفسارات"
            case .profile:
              return "الملف الشخصي"
            case .SignOut:
              return "تسجيل الخروج"
            }
        }

        var img:UIImage? {
             switch self {
             case .home:
              return  "ic_home".image_
             case .categories:
               return  "ic_categories".image_
             case .chat:
               return  "ic_chats".image_
             case .search:
               return "ic_search".image_
             case .addresses:
               return "ic_locations".image_
             case .consultations:
               return "ic_questions".image_
             case .profile:
               return "ic_profile".image_
             case .SignOut:
              return "ic_logout".image_
                    
         }
      }
    }
    
    //getCategories
    class func getCategories( complete: @escaping ((_ data: [Category]) -> Void), failure: @escaping ((_ message: String) -> Void) ) {
        let request = BaseRequest()
        request.url = "getCategories"
        request.method = .get
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = Categories.init(fromJson: JSON(json.object))
            if !data.success {
                failure(data.message)
                return
            }
            Constant.shared.categories = data.categories ?? []
            complete(data.categories)
            print(data)
        }
    }
    
    class func userLogin(email: String, password: String, complete: @escaping (() -> Void)) {
        let dic = [
            "username": email , //"fhanna@intertech.ps"
            "password": password
        ]
        let request = BaseRequest()
        request.url = "userLogin"
        request.method = .post
        request.parameters = dic
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = UserModel.init(fromJson: json)
            if data.success {
                if let user = data.userDetails {
                    if let id = user.id,
                        let name = user.name,
                        let arName = user.arName,
                        let email = user.email,
                        let city = user.city,
                        let mobile = user.mobile,
                        let type = user.type,
                        let token = data.token {
                        UserProfile.fillUserData(id, name, arName, email, city, mobile, type, token)
                    }
                    complete()
                }
                return
            }
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
            vc.ErrorMessage(title: "", errorbody: data.message)

        }
    }
}
