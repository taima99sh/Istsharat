//
//  AskConsultationViewController.swift
//  Istsharat
//
//  Created by taima on 2/3/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import BEMCheckBox
import DropDown

class AskConsultationViewController: UIViewController {
    
    @IBOutlet weak var lblNavTitle: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var successViews: UIView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnType: UIButton!
    @IBOutlet weak var checkBox: BEMCheckBox!
    
    var arrType = ["نفسية", "صحية", "عائلية", "حياتية"]
    var arrCatIds: [Int] = []
    var cat: String = ""
    
    let chooseDropDown = DropDown()

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
    
    @IBAction func btnSend(_ sender: Any) {
        guard self.validation() else {return}
        //
        let title = self.txtTitle.text ?? ""
        let description = self.txtView.text ?? ""
        let id = UserProfile.shared.userID ?? 0
        let dic = [
            "u_id": "\(id)",
            "title": title,
            "description": description,
            "category": cat,
            "is_public": "1"
        ]
        let request = BaseRequest()
        request.url = "SendQuestion"
        request.method = .post
        request.parameters = dic
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            print (json)
            self.successViews.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // your code here
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func btnType(_ sender: Any) {
        chooseDropDown.show()
    }
    
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
    
    func setupChooseDropDown() {
        chooseDropDown.anchorView = btnType
        chooseDropDown.bottomOffset = CGPoint(x: 0, y: btnType.bounds.height)
        chooseDropDown.textFont = Constant.shared.ProjectFont.toFont() ?? .systemFont(ofSize: 15)
        chooseDropDown.dataSource = self.arrType
        // Action triggered on selection
        chooseDropDown.selectionAction = { [weak self] (index, item) in
            self?.txtType.text = item
            if Connectivity.isConnectedToInternet { self?.cat = "\(self?.arrCatIds[index] ?? 0)"}
        }
    }
    
    func setupDefaultDropDown() {
        DropDown.setupDefaultAppearance()
        chooseDropDown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        chooseDropDown.customCellConfiguration = nil
    }
}
extension AskConsultationViewController {
    func setupView(){
        self.successViews.isHidden = true
        self.checkBox.boxType = .square
        setupChooseDropDown()
        self.txtView.font = Constant.shared.ProjectFont.toFont(size: 17) ?? .systemFont(ofSize: 17)
    }
    func localized(){}
    func setupData(){}
    func fetchData(){
        Constant.getCategories(complete: { (categories) in
            self.arrType =  categories.map { $0.cArName }
            self.arrCatIds =  categories.map { $0.cId }
            self.chooseDropDown.dataSource = self.arrType
        }) { (message) in
            print(message)
        }
    }
}

extension AskConsultationViewController {
    func validation() -> Bool {
        if (txtTitle.isValidValue && txtType.isValidValue && txtView.isValidValue) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
}
