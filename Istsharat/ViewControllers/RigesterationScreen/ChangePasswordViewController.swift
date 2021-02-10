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
    
    var email: String = ""
    
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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func btnChangePassword(_ sender: Any) {
        
        guard self.validation() else {return}
        let code = txtCode.text ?? ""
        let newPassword = txtENewPassword.text ?? ""
        let dic = [
            "email": self.email,
            "code": code,
            "newpass": newPassword
        ]
        let request = BaseRequest()
        request.url = "ResetPassword"
        request.method = .post
        request.parameters = dic
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = GeneralResponseModel.init(fromJson: json)
            if data.success {
                self.SuccessMessage(title: "", successbody: "تم تغيير كلمة المرور")
                if !UserProfile.shared.isUserLogin() {
                    let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
                    AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                }
                return
            }
            self.ErrorMessage(title: "", errorbody: data.message)
            print (json)
        }
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
        if (txtConfirmPassword.isValidValue && txtENewPassword.isValidValue && txtCode.isValidValue && passwordValidation()) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
    
    func passwordValidation() -> Bool {
        if !(txtENewPassword.text ?? "" == txtConfirmPassword.text ?? "") {
            self.ErrorMessage(title: "", errorbody: "كلمة المرور غير متطابقة")
            return false
        }
        return true
    }
}
