//
//  ConsultationViewController.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ConsultationViewController: UIViewController {
    
    @IBOutlet weak var lblNavTitle: UILabel!
    
    @IBOutlet weak var lblConsultationTitle: UILabel!
    
    @IBOutlet weak var lblConsultationType: UILabel!
    
    @IBOutlet weak var txtConsultation: UITextView!
    
    @IBOutlet weak var btnChat: UIButton!
    
    @IBOutlet weak var dataStackView: UIStackView!
    
    
    var id: Int?
    var NavTitle = ""
    var catID = 0
    
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
    
    @IBAction func btnConsultation(_ sender: Any) {
        
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TestViewController")  as! TestViewController
        vc.catID = self.catID
        vc.preVc = "fromConsultationVC"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
}
extension ConsultationViewController {
    func setupView(){
        txtConsultation.font = Constant.shared.ProjectFont.toFont(size: 17)
        self.dataStackView.isHidden = true
    }
    func localized(){}
    func setupData(){
        self.lblNavTitle.text = self.NavTitle
    }
    
    @objc func fetchData(){
        let request = BaseRequest()
        request.url = "PageDetails?p_id=\(self.id ?? 0)"
        request.method = .get
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = PageDetails.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            if let obj = data.pages {
                self.dataStackView.isHidden = false
                self.lblNavTitle.text = obj.catName ?? "استشارة"
                self.lblConsultationType.text = obj.catName ?? "استشارة"
                self.lblConsultationTitle.text = obj.pTitle ?? ""
                self.txtConsultation.text = obj.pBody.html2Attributed?.string
            }
            print(data)
        }
    }
}
