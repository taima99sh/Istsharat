//
//  AskConsultationViewController.swift
//  Istsharat
//
//  Created by taima on 2/3/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import BEMCheckBox

class AskConsultationViewController: UIViewController {
    
    @IBOutlet weak var lblNavTitle: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var checkBox: BEMCheckBox!
    

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
        self.successView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            // your code here
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
}
extension AskConsultationViewController {
    func setupView(){
        self.successView.isHidden = true
        self.checkBox.boxType = .square
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
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
