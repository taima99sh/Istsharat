//
//  MenuTableViewCell.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class MenuTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    
    override func configureCell() {
        if let obj = self.object?.object as? Constant.MenuItems {
            self.imgIcon.image = obj.img
            self.lblTitle.text = obj.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    if let parent = self.parentVC as? MenuViewController {
                        if let obj = self.object?.object as? Constant.MenuItems {
                            switch obj {case .home:
                                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
                                parent.toggleRightViewAnimated(self)
                                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                            case .categories:
                                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CategoriesViewController")
                                parent.toggleRightViewAnimated(self)
                                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                            case .chat:
                                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ChatListViewController")
                                parent.toggleRightViewAnimated(self)
                                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                            case .search:
                                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "SearchViewController")
                                parent.toggleRightViewAnimated(self)
                                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                            case .addresses:
                                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConsultationViewController") as! ConsultationViewController
                            vc.id = 7
                                parent.toggleRightViewAnimated(self)
                                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                            case .consultations:
                                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConsultationsViewController")
                                parent.toggleRightViewAnimated(self)
                                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                            case .profile:
                                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "RigesterViewController")
                                parent.toggleRightViewAnimated(self)
                                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                            case .SignOut:
                                parent.showAlert(title: "", message: "هل تريد الخروج؟",button1title: "تأكيد", button2title: "إلغاء", button1action: {
                                    UserDefaults.resetDefaults()
                                    let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
                                    parent.toggleRightViewAnimated(self)
                                    AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                                    
                                }) {
                                    
                                }
                            }
                        }
                    }
        }
    
}
