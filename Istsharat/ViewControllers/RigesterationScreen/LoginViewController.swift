//
//  LoginViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import BEMCheckBox

class LoginViewController: UIViewController {
    
    @IBOutlet weak var checkBox: BEMCheckBox!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnForgetPassword: UIButton!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnToRigester: UIButton!
    
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
    
    @IBAction func btnLogin(_ sender: Any) {
        guard self.validation() else {return}
        
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    @IBAction func btnToRigester(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "RigesterViewController")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnForgetPassword(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ForgetPasswordViewController")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension LoginViewController {
    func setupView(){
        self.checkBox.boxType = .square
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension LoginViewController {
    func validation() -> Bool {
        if (txtEmail.isValidValue && txtPassword.isValidValue && Emailvalidation()) == false {
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
