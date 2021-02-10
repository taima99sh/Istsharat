//
//  ForgetPasswordViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var btnDone: UIButton!
    

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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func btnDone(_ sender: Any) {
        guard self.validation() else {return}
        let email = self.txtEmail.text ?? ""
        let dic = ["email": email]
        let request = BaseRequest()
        request.url = "ForgetPassword"
        request.method = .post
        request.parameters = dic
        
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = GeneralResponseModel.init(fromJson: json)
            if data.success {
                self.SuccessMessage(title: "", successbody: data.message)
                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
                vc.email = email
                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
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
extension ForgetPasswordViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension ForgetPasswordViewController {
    func validation() -> Bool {
        if (txtEmail.isValidValue && Emailvalidation()) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
    func Emailvalidation() -> Bool {
        if !(txtEmail.text?.isValidEmail()  ?? true) {
            self.ErrorMessage(title: "", errorbody: "البريد الالكتروني عير صحيح")
            return false
        }
        return true
    }
}
