//
//  QuestionDetailsViewController.swift
//  Istsharat
//
//  Created by taima on 2/7/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import SwiftyJSON

class QuestionDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var txtBody: UILabel!
    @IBOutlet weak var txtReply: UILabel!
    @IBOutlet weak var dataStackView: UIStackView!
    
    
    var id = 0
    
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
    }
}
extension QuestionDetailsViewController {
    func setupView(){
        //self.dataStackView.isHidden = true
    }
    func localized(){}
    func setupData(){
        
    }
    @objc func fetchData(){
        let request = BaseRequest()
        let id = UserProfile.shared.userID ?? 0
        request.url = "QuestionDetails?u_id=\(id)&q_id=\(self.id)"
        request.method = .get
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = QuestionsDetails.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            if let obj = data.details {
                //self.dataStackView.isHidden = false
                self.lblTitle.text = obj.title ?? "استشارة"
                self.txtBody.text = obj.descriptionField ?? ""
                self.txtReply.text = obj.status == 0 ? "لم يتم الرد بعد على سؤالك" : obj.replyDescription ?? ""
                
            }
            print(data)
        }
    }
}
