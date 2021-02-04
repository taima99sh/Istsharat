//
//  ChangePasswordViewController.swift
//  Istsharat
//
//  Created by taima on 2/3/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtENewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnChangePassword(_ sender: Any) {
        guard self.validation() else {return}
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
}
extension ChangePasswordViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension ChangePasswordViewController {
    func validation() -> Bool {
        if (txtConfirmPassword.isValidValue && txtENewPassword.isValidValue && txtCode.isValidValue ) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
}
