//
//  ViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import DropDown

class RigesterViewController: UIViewController {
    @IBOutlet weak var txtNavTitle: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var btnRigester: UIButton!
    @IBOutlet weak var btnCity: UIButton!
    
    let chooseDropDown = DropDown()
    
    var arrType = ["القدس"
, "بيت لحم", "رام الله", "غزة"]

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
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func btnType(_ sender: UIButton) {
        chooseDropDown.show()
    }
    
    @IBAction func btnRigester(_ sender: Any) {
        guard self.validation() else {return}
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    @IBAction func btnCity(_ sender: UIButton) {
        chooseDropDown.show()
    }
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
    
    func setupChooseDropDown() {
        chooseDropDown.anchorView = btnCity
        chooseDropDown.bottomOffset = CGPoint(x: 0, y: btnCity.bounds.height)
        chooseDropDown.textFont = "Helvetica Neue W23 for SKY".toFont() ?? UIFont(name: "Arial", size: 14)!
        chooseDropDown.dataSource = self.arrType
        // Action triggered on selection
        chooseDropDown.selectionAction = { [weak self] (index, item) in
            self?.txtCity.text = item
        }
    }
}

extension RigesterViewController {
    func setupView(){
        setupChooseDropDown()
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}


extension RigesterViewController {
    func validation() -> Bool {
        if (txtConfirmPassword.isValidValue &&
            txtEmail.isValidValue &&
            txtPassword.isValidValue &&
            txtName.isValidValue &&
            txtAddress.isValidValue &&
            txtCity.isValidValue &&
            txtPhone.isValidValue &&
            Emailvalidation()) == false {
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

