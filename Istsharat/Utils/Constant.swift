//
//  File.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import Foundation
import  UIKit

class Constant {
    static let shared = Constant()
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
}
