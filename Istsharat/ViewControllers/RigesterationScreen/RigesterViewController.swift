//
//  ViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON

class RigesterViewController: UIViewController {
    
    enum typePage: String {
        case register
        case profile
    }
    @IBOutlet weak var txtNavTitle: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRigester: UIButton!
    @IBOutlet weak var btnCity: UIButton!
    @IBOutlet weak var btnSideMenu: UIButton!
    
    let chooseDropDown = DropDown()
    
    var type: typePage = .register {
        didSet {
            updateGUI()
        }
    }
    var arrType = ["القدس"
, "بيت لحم", "رام الله", "غزة"]
    
    var arrCatIds: [Int] = []
    var cityId: String = ""

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
        sideMenuController?.isRightViewSwipeGestureEnabled = true
        self.type = UserProfile.shared.isUserLogin() ? .profile : .register
        sideMenuController?.isRightViewSwipeGestureEnabled = UserProfile.shared.isUserLogin() ? true : false
    }
    
    
    @IBAction func btnType(_ sender: UIButton) {
        chooseDropDown.show()
    }
    
    @IBAction func btnRigester(_ sender: Any) {
        guard self.validation() else {return}
        
        let name = txtName.text ?? ""
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        let mobile = txtPhone.text ?? ""
        let city = self.cityId
        
        switch self.type {
        case .register:
            let dic = [
                    "name": name,
                    "email": email,
                    "password": password,
                    "mobile": mobile,
                    "city": city,
                    "latitude": "",
                    "device_token": "",
                    "longitude": ""
                ]
                let request = BaseRequest()
                request.url = "Register"
                request.method = .post
                request.parameters = dic
                RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
                    print (json)
                    let data = GeneralResponseModel.init(fromJson: JSON(json.object))
                    if data.success {
                        Constant.userLogin(email: email, password: password) {
                                   self.SuccessMessage(title: "", successbody: "تم تسجيل الدخول بنجاح")
                                   let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
                                   AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
                               
                        }
                        return
                    }
                    self.ErrorMessage(title: "", errorbody: data.message)
                }
        case .profile:
            let token = UserProfile.shared.userToken ?? ""
            let dic = [
                "name": name,
                "email": email,
                "password": password,
                "mobile": mobile,
                "city": city,
                "latitude": "",
                "device_token": "",
                "longitude": "",
                "token": token
            ]
            let id = UserProfile.shared.userID ?? 0
            let request = BaseRequest()
            request.url = "updateProfile/\(id)"
            request.method = .post
            request.parameters = dic
            
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
                print (json)
                let data = UserModel.init(fromJson: json)
                if data.success {
                    if let user = data.userDetails {
                        if let id = user.id,
                            let name = user.name,
                            let arName = user.arName,
                            let email = user.email,
                            let city = user.city,
                            let mobile = user.mobile,
                            let type = user.type {
                            UserProfile.fillUserData(id, name, arName, email, city, mobile, type)
                            self.SuccessMessage(title: "", successbody: "تم تحديث البيانات بنجاح")
                        }
                    }
                    return
                }
                self.ErrorMessage(title: "", errorbody: data.message)
            }
        }

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
        chooseDropDown.textFont = Constant.shared.ProjectFont.toFont() ?? UIFont(name: "Arial", size: 14)!
        chooseDropDown.dataSource = self.arrType
        // Action triggered on selection
        chooseDropDown.selectionAction = { [weak self] (index, item) in
            self?.btnCity.setTitle(item, for: .normal)
            if Connectivity.isConnectedToInternet {self?.cityId = "\(self?.arrCatIds[index] ?? 0)"}
        }
    }
}
extension RigesterViewController {
    func setupView(){
        setupChooseDropDown()
    }
    func localized(){}
    func setupData(){}
    func fetchData(){
        let request = BaseRequest()
        request.url = "listCities"
        request.method = .get
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = Cities.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            self.arrType =  data.cities.map { $0.cityArName }
            self.arrCatIds =    data.cities.map { $0.cityId }
            self.chooseDropDown.dataSource = self.arrType
            self.btnCity.setTitle(self.type == .profile ? self.arrType[UserProfile.shared.cityID ?? 0]: "المدينة", for: .normal)
            print(data)
        }
    }
}

extension RigesterViewController {
    func validation() -> Bool {
        if (txtEmail.isValidValue &&
            txtPassword.isValidValue &&
            txtName.isValidValue &&
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

extension RigesterViewController {
    func updateGUI() {
        switch self.type {
        case .register:
            self.btnRigester.setTitle("تسجيل", for: .normal)
            self.txtNavTitle.text = "تسجيل جديد"
            self.btnSideMenu.isHidden = true
        case .profile:
            self.btnRigester.setTitle("حفظ", for: .normal)
            self.txtNavTitle.text = "الملف الشخصي"
            self.btnSideMenu.isHidden = false
            self.txtName.text = UserProfile.shared.name ?? ""
            self.txtEmail.text = UserProfile.shared.email ?? ""
            self.txtPhone.text = UserProfile.shared.mobileNumber ?? ""
            self.txtName.text = UserProfile.shared.name ?? ""
        }
    }
}

extension RigesterViewController {
    
}

