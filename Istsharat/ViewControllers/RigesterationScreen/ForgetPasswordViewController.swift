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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func btnDone(_ sender: Any) {
        guard self.validation() else {return}
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ChangePasswordViewController")
        
        self.navigationController?.pushViewController(vc, animated: true)
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
